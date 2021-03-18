package = "kong-plugin-zipkin"
version = "0.0.1"

source = {
  url = "github-path-to-source-zip",
  dir = "directory-created",
}

description = {
  summary = "<traceable-summary>",
  detailed = [[
    <detailed description>
  ]],
  homepage = "<github-page>",
  license = "Apache 2.0",
}

dependencies = {
  "lua >= 5.1",
  "lua-cjson",
  "lua-resty-http >= 0.11",
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.traceable.handler"] = "kong/plugins/traceable/handler.lua",
    ["kong.plugins.traceaable.schema"] = "kong/plugins/traceable/schema.lua",
  },
}
