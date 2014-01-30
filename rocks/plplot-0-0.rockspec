package = "plplot"
version = "0-0"

source = {
   url = ""
}

description = {
   summary = "A FFI interface to PLplot",
   homepage = ""
}

dependencies = {
   "lua >= 5.1", "torchffi",
}

build = {
   type = "builtin",
   modules = {
      ["plplot"] = "init.lua",
      ["plplot.api"] = "api.lua",
      ["plplot.cdefs"] = "cdefs.lua"
   }
}
