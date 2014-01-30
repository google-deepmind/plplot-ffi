require 'util'
local sdl = require 'sdl2'
local cairo = require 'oocairo'
local plplot = require 'plplot'


local WIDTH  = 800
local HEIGTH = 800

-- Cairo initialization
local cairoSurface = cairo.image_surface_create("rgb24", WIDTH, HEIGTH)
local cairoContext = cairo.context_create(cairoSurface)
cairoContext:set_source_rgb(1, 1, 1)
cairoContext:paint()

-- PLplot
plplot.init(cairoContext, WIDTH, HEIGTH)
plplot.hist(torch.randn(10000), 20)
plplot.labels('Test', 'X axis', 'Y axis')
plplot.close()

local filename = 'hist.png'
print('Writing output to '..filename)
cairoSurface:write_to_png(filename)
