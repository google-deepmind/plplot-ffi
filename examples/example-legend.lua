local cairo = require 'oocairo'
local plplot = require 'plplot'
local pl = require 'plplot.api'


local WIDTH  = 800
local HEIGHT = 800

-- Cairo initialization
local cairoSurface = cairo.image_surface_create("rgb24", WIDTH, HEIGHT)
local cairoContext = cairo.context_create(cairoSurface)
cairoContext:set_source_rgb(1, 1, 1)
cairoContext:paint()

-- PLplot
local x = torch.DoubleTensor{0,1,2,3,4,5,6,7,8,9,10}

local plots = {}
for i = 1,3 do
    plots[i] = {'Line ' .. i, x, torch.mul(x,i), '*-'}
end

plplot.init(cairoContext, WIDTH, HEIGHT)
plplot.plot(plots)
plplot.labels('Line Plot', 'X axis', 'Y axis')
plplot.legend(plots, {position=pl.POSITION_LEFT+pl.POSITION_TOP, size=0.2})
plplot.close()

local filename = 'legend.png'
print('Writing output to '..filename)
cairoSurface:write_to_png(filename)
