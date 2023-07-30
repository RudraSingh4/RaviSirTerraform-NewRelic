mod2 = {
  monitor001 = {
    status           = "ENABLED"
    name             = "script_monitor01"
    type             = "SCRIPT_API"
    locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
    period           = "EVERY_6_HOURS"
    script_language      = "JAVASCRIPT"
    runtime_type         = "NODE_API"
    runtime_type_version = "16.10"
  }

  monitor002 = {
    status           = "ENABLED"
    name             = "script_monitor02"
    type             = "SCRIPT_API"
    locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
    period           = "EVERY_6_HOURS"

    

    script_language      = "JAVASCRIPT"
    runtime_type         = "NODE_API"
    runtime_type_version = "16.10"
  }
}
