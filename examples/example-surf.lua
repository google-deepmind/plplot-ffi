local cairo = require 'oocairo'
local plplot = require 'plplot'


local WIDTH  = 800
local HEIGHT = 800

-- Cairo initialization
local cairoSurface = cairo.image_surface_create("rgb24", WIDTH, HEIGHT)
local cairoContext = cairo.context_create(cairoSurface)
cairoContext:set_source_rgb(1, 1, 1)
cairoContext:paint()

-- PLplot
x = torch.linspace(-1,1)
z = torch.sin(torch.zeros(x:size(1),x:size(1)):addr(x,x)*math.pi*2)

plplot.init(cairoContext, WIDTH, HEIGHT)
plplot.splot({x,x,z})
plplot.labels3d('x', 'y', 'z')
plplot.title('z=sin(xy)')
plplot.close()

local filename = 'surf.png'
print('Writing output to '..filename)
cairoSurface:write_to_png(filename)
