print[[
-- Do not change this file manually
-- Generated with dev/create-api.lua

local ffi = require 'ffi'
local C = pcall(ffi.load, 'plplotd')
if not C then
   C = ffi.load('libplplotd.so.11')
end
local pl = {C = C}

require 'plplot.cdefs'

local function register(luafuncname, funcname)
   local symexists, msg = pcall(function()
                              local sym = C[funcname]
                           end)
   if symexists then
      pl[luafuncname] = C[funcname]
   end
end
]]

local defined = {}

local txt = io.open('cdefs.lua'):read('*all')
for funcname in txt:gmatch('c_pl([^%=,%.%;<%s%(%)]+)%s*%(') do
   if funcname and not defined[funcname] then
      local luafuncname = funcname:gsub('^..', function(str)
                                                  if str == 'RW' then
                                                     return str
                                                  else
                                                     return string.lower(str:sub(1,1)) .. str:sub(2,2)
                                                  end
                                               end)
      print(string.format("register('%s', 'c_pl%s')", luafuncname, funcname))
      defined[funcname] = true
   end
end

print("register('cmd', 'pl_cmd')")
print("register('plend', 'c_plend')")
print("")

for defname in txt:gmatch('PLESC([^%=,%.%;<%s%(%)|%[%]]+)') do
   if not defined[defname] and defname == string.upper(defname) then
      print(string.format("register('ESC%s', 'PLESC%s')", defname, defname))
   end
end

print("")

for defname in txt:gmatch('PL_([^%=,%.%;<%s%(%)|%[%]]+)') do
   if not defined[defname] and defname == string.upper(defname) then
      print(string.format("register('%s', 'PL_%s')", defname, defname))
   end
end

print[[

return pl
]]
