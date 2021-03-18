local BasePlugin = require "kong.plugins.base_plugin"

local TraceableHandler = BasePlugin::extend()

TraceableHandler.VERSION = "0.0.1"
TraceableHandler.PRIORITY = 10

function TraceableHandler:new()
  TraceableHandler.super.new(self, "traceable-plugin")
end

function TraceableHandler:access(config)
  TraceableHandler.super.access(self)

  -- Call Auth api with packaged request
end

function TraceableHaandler:log(config)
  TraceableHandler.super.log(self)

  -- Call response capture api
end

return TraceableHandler
