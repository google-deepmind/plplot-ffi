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

    return legend,x,y,format
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
    return legend,x,y,z
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

local function fixMinMax(min, max)
    if math.abs(min-max) < 1e-16 then
        local temp = min
        min = temp - 1
        max = temp + 1
    end
    return min, max
end

function plplot.plot(...)
    if select('#',...) == 0 then return end
    local arg = ...

    local datax = {}
    local datay = {}
    local formats = {}
    local legends = {}

    -- Only one plot
    if type(arg[1]) ~= "table" then
        arg = {arg}
    end

    -- Reading arguments
    xmin = math.huge
    xmax = -math.huge
    ymin = math.huge
    ymax = -math.huge
    for i,v in ipairs(arg) do
        local l,x,y,f = arguments(v)
        datax[#datax+1] = x
        if x:min() < xmin then xmin = x:min() end
        if x:max() > xmax then xmax = x:max() end
        datay[#datay+1] = y
        if y:min() < ymin then ymin = y:min() end
        if y:max() > ymax then ymax = y:max() end
        formats[#formats+1] = f
        legends[#legends+1] = l
    end

    xmin, xmax = fixMinMax(xmin, xmax)
    ymin, ymax = fixMinMax(ymin, ymax)

    -- Axis
    pl.col0(0)
    pl.env(xmin, xmax, ymin, ymax, 0, 0)

    -- Plotting
    for i = 1,#datax do
        x = datax[i]
        y = datay[i]
        format = formats[i]

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
        arg = {arg}
    end

    -- Reading arguments
    local xmin = math.huge
    local xmax = -math.huge
    local ymin = math.huge
    local ymax = -math.huge
    local zmin = math.huge
    local zmax = -math.huge
    for i,v in ipairs(arg) do
        local l,x,y,z = argumentsSurface(v)
        datax[#datax+1] = x
        if x:min() < xmin then xmin = x:min() end
        if x:max() > xmax then xmax = x:max() end
        datay[#datay+1] = y
        if y:min() < ymin then ymin = y:min() end
        if y:max() > ymax then ymax = y:max() end
        dataz[#dataz+1] = z
        if z:min() < zmin then zmin = z:min() end
        if z:max() > zmax then zmax = z:max() end
        legends[#legends+1] = l
    end

    xmin, xmax = fixMinMax(xmin, xmax)
    ymin, ymax = fixMinMax(ymin, ymax)
    zmin, zmax = fixMinMax(zmin, zmax)

    -- Axis
    pl.col0(0)
    pl.adv(0)
    pl.vpor(0, 1, 0, 0.9)
    pl.wind(xmin, xmax, ymin*0.9, ymax*1.1)
    pl.w3d(1, 1, 0.8, xmin, xmax, ymin, ymax, zmin, zmax, 60, 30)

    -- Plotting
    for i = 1,#datax do
        x = datax[i]
        y = datay[i]
        z = dataz[i]

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
    local min  = min or data:min()
    local max  = max or data:max()

    min, max = fixMinMax(min, max)

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
