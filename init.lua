local ffi = require 'ffi'
local pl = require 'plplot.api'

plplot = {}

local function istensor(v)
    return type(v) == 'userdata' and torch.typename(v):sub(-6) == 'Tensor'
end

local function isstring(v)
    return type(v) == 'string'
end

-- Based on a similar function from http://github.com/torch/gnuplot
local function arguments(t)
    local errorMessage = 'expecting [string,] tensor [,tensor] [,string]'

    local legend = nil
    local x = nil
    local y = nil
    local format = nil

    if #t == 0 then
        error('empty argument list')
    end

    if #t >= 1 then
        if isstring(t[1]) then
            legend = t[1]
        elseif istensor(t[1]) then
            x = t[1]
        else
            error()
        end
    end
    if #t >= 2 then
        if x and isstring(t[2]) then
            format = t[2]
        elseif x and istensor(t[2]) then
            y = t[2]
        elseif legend and istensor(t[2]) then
            x = t[2]
        else
            error(errorMessage)
        end
    end
    if #t >= 3 then
        if legend and x and istensor(t[3]) then
            y = t[3]
        elseif legend and x and isstring(t[3]) then
            format = t[3]
        elseif x and y and isstring(t[3]) then
            format = t[3]
        else
            error(errorMessage)
        end
    end
    if #t == 4 then
        if legend and x and y and isstring(t[4]) then
            format = t[4]
        else
            error(errorMessage)
        end
    end
    legend = legend or ''
    format = format or ''
    if not x then
        error(errorMessage)
    end
    if not y then
        if x:dim() == 2 and x:size(2) == 2 then
            y = x:select(2,2)
            x = x:select(2,1)
        elseif x:dim() == 2 and x:size(2) == 4 and format == 'v' then
            y = torch.Tensor(x:size(1),2)
            xx= torch.Tensor(x:size(1),2)
            y:select(2,1):copy(x:select(2,2))
            y:select(2,2):copy(x:select(2,4))
            xx:select(2,1):copy(x:select(2,1))
            xx:select(2,2):copy(x:select(2,3))
            x = xx
        elseif x:dim() == 2 and x:size(2) > 1 then
            y = x[{ {}, {2,-1} }]
            x = x:select(2,1)
        else
            y = x
            x = torch.range(1,y:size(1))
        end
    end
    if x:dim() ~= 1 and x:dim() ~= 2 then
        error('x and y dims are wrong :  x = ' .. x:nDimension() .. 'D y = ' .. y:nDimension() .. 'D')
    end
    if y:size(1) ~= x:size(1) then
        error('x and y dims are wrong :  x = ' .. x:nDimension() .. 'D y = ' .. y:nDimension() .. 'D')
    end

    x = x:contiguous()
    y = y:contiguous()

    return {x = x, y = y, format = format, legend = legend}
end

-- Based on a similar function from http://github.com/torch/gnuplot
local function argumentsSurface(t)
    local errorMessage = 'expecting [string,] tensor [,tensor] [,string]'

    local legend = nil
    local x = nil
    local y = nil
    local z = nil

    if #t == 0 then
        error('empty argument list')
    end

    if #t >= 1 then
        if isstring(t[1]) then
            legend = t[1]
        elseif istensor(t[1]) then
            x = t[1]
        else
            error(errorMessage)
        end
    end
    if #t >= 2 and #t <= 4 then
        if x and istensor(t[2]) and istensor(t[3]) then
            y = t[2]
            z = t[3]
        elseif legend and istensor(t[2]) and istensor(t[3]) and istensor(t[4]) then
            x = t[2]
            y = t[3]
            z = t[4]
        elseif legend and istensor(t[2]) then
            x = t[2]
        else
            error(errorMessage)
        end
    elseif #t > 4 then
        error(errorMessage)
    end
    legend = legend or ''
    if not x then
        error(errorMessage)
    end
    if not z then
        z = x
        x = torch.range(1,z:size(1))
        y = torch.range(1,z:size(2))
    end
    if x:nDimension() ~= 1 or y:nDimension() ~= 1 or z:nDimension() ~= 2 then
        error('x and y and z have incorrect dimensions: x = ' .. x:nDimension() .. 'D y = ' .. y:nDimension() .. 'D z = '.. z:nDimension() .. 'D' )
    end

    x = x:contiguous()
    y = y:contiguous()
    z = z:contiguous()

    return {x = x, y = y, z = z, legend = legend}
end

function plplot.colors(axisColor, colors)
    local axisColor = axisColor or {0,0,0}
    local colors = colors or {{255,0,0}, {0,255,0}, {0,0,255}}

    pl.scol0(0, unpack(axisColor))
    for i = 1,15 do
        pl.scol0(i, unpack(colors[(i-1) % #colors + 1]))
    end
end

function plplot.init(cairoContext, width, height)
    -- Set dimensions
    assert(pl.setopt('geometry', string.format('%dx%d',width,height)), 'Error in PLplot function plsetopt')

    -- Set device and initialize
    pl.sdev('extcairo')
    pl.init()

    -- Set cairo context
    local p = ffi.new('void*[1]')
    -- We have to derreference the pointer
    ffi.copy(p, cairoContext, ffi.sizeof('void*'))
    pl.cmd(pl.ESC_DEVINIT, p[0])

    -- Default colors
    plplot.colors()
end

function plplot.title(title)
    pl.col0(0)
    pl.mtex('t', 1, 0.5, 0.5, title)
end

function plplot.labels(title, xlabel, ylabel)
    pl.col0(0)
    pl.lab(xlabel, ylabel, title)
end

function plplot.labels3d(xlabel, ylabel, zlabel)
    pl.col0(0)
    pl.box3('bnstu', xlabel, 0.0, 0, 'bnstu', ylabel, 0.0, 0, 'bcdmnstuv', zlabel, 0.0, 0)
end

local function initializeAxis(arg)
    local function getValue(value, sign)
        return {value = value or sign*math.huge, fixed = (value~=nil)}
    end

    local arg = arg or {}
    return {
        min = getValue(arg[1], 1),
        max = getValue(arg[2], -1),
    }
end

local function updateAxis(axis, v)
    if not axis.max.fixed then
        if v:max() > axis.max.value then axis.max.value = v:max() end
    end
    if not axis.min.fixed then
        if v:min() < axis.min.value then axis.min.value = v:min() end
    end
end

local function adjustAxis(axis)
    if math.abs(axis.min.value - axis.max.value) < 1e-16 then
        local temp = axis.min.value
        axis.min.value = temp - 1
        axis.max.value = temp + 1
    end
end

local function getMinMax(axis)
    return axis.min.value, axis.max.value
end

local function onePlotArg(arg)
    local newArg = {{}}
    -- Keep named elements and bundle unnamed elements
    for i, v in pairs(arg) do
        if type(i) == "number" then
            newArg[1][i] = v
        else
            newArg[i] = v
        end
    end
    return newArg
end

function plplot.plot(...)
    if select('#',...) == 0 then return end
    local arg = ...

    -- Only one plot
    if type(arg[1]) ~= "table" then
        arg = onePlotArg(arg)
    end

    -- Reading arguments
    local axes = arg.axes or {}
    local xaxis = initializeAxis(axes.x)
    local yaxis = initializeAxis(axes.y)
    local data = {}
    for i, v in ipairs(arg) do
        data[i] = arguments(v)
        updateAxis(xaxis, data[i].x)
        updateAxis(yaxis, data[i].y)
    end

    adjustAxis(xaxis)
    adjustAxis(yaxis)

    -- Axis
    local xmin, xmax = getMinMax(xaxis)
    local ymin, ymax = getMinMax(yaxis)
    pl.col0(0)
    pl.env(xmin, xmax, ymin, ymax, 0, 0)

    -- Plotting
    for i, v in pairs(data) do
        local x = v.x
        local y = v.y
        local legend = v.legend
        local format = v.format

        pl.col0((i-1)%14+1)
        if format:find('|') then
            pl.bin(x:size(1), torch.data(x), torch.data(y), 0)
        else
            if format == '' or format:find('-') then
                pl.line(x:size(1), torch.data(x), torch.data(y))
            end
            local c = string.match(format,'[^-]')
            if c then
                pl.string(x:size(1), torch.data(x), torch.data(y), c);
            end
        end
    end
end

function plplot.splot(...)
    if select('#',...) == 0 then return end
    local arg = ...

    local datax = {}
    local datay = {}
    local dataz = {}
    local legends = {}

    -- Only one plot
    if type(arg[1]) ~= "table" then
        arg = onePlotArg(arg)
    end

    -- Reading arguments
    local axes = arg.axes or {}
    local xaxis = initializeAxis(axes.x)
    local yaxis = initializeAxis(axes.y)
    local zaxis = initializeAxis(axes.z)
    local data = {}
    for i, v in ipairs(arg) do
        data[i] = argumentsSurface(v)
        updateAxis(xaxis, data[i].x)
        updateAxis(yaxis, data[i].y)
        updateAxis(zaxis, data[i].z)
    end

    adjustAxis(xaxis)
    adjustAxis(yaxis)
    adjustAxis(zaxis)

    -- Axis
    local xmin, xmax = getMinMax(xaxis)
    local ymin, ymax = getMinMax(yaxis)
    local zmin, zmax = getMinMax(zaxis)
    pl.col0(0)
    pl.adv(0)
    pl.vpor(0, 1, 0, 0.9)
    pl.wind(-1, 1, -0.9, 1.1)
    pl.w3d(1, 1, 0.8, xmin, xmax, ymin, ymax, zmin, zmax, 60, 30)

    -- Plotting
    for i, v in pairs(data) do
        local x = v.x
        local y = v.y
        local z = v.z

        z_data = ffi.new('const double * [?]', x:size(1))
        for i = 1,x:size(1) do
            z_data[i-1] = torch.data(z[i])
        end

        pl.col0((i-1)%14+1)
        pl.surf3d(torch.data(x), torch.data(y), z_data, x:size(1), y:size(1), 0, nil, 0)
    end
end

function plplot.hist(data, nbin, min, max)
    assert(data:dim() == 1, '1D tensor expected')

    local n    = data:size(1)
    local nbin = nbin or math.ceil(math.sqrt(n)) -- Sturges: math.ceil(math.log(n)/math.log(2)+1)

    local xaxis = initializeAxis{min or data:min(), max or data:max()}
    adjustAxis(xaxis)
    local min, max = getMinMax(xaxis)

    local ymax = torch.histc(data, nbin, min, max):max()

    pl.col0(0)
    pl.env(min, max, 0, ymax*1.1, 0, 0)

    pl.col0(1)
    pl.hist(data:size(1), torch.data(data), min, max, nbin, pl.HIST_NOSCALING)
end

function plplot.close()
    pl.plend()
end

return plplot
