local typedefs = require "kong.db.schema.typedefs"

return {
  name = "traceable",
  fields = {
    {
      config = {
        type = "record",
        fields = {
          { ext_cap_endpoint = typedefs.url },
        },
      },
    },
  },
}
