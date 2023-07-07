api-monitor = {
  monitor1 = {
    status           = "ENABLED"
    name             = "script_monitor"
    type             = "SCRIPT_API"
    locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
    period           = "EVERY_6_HOURS"

    script = "console.log('it works!')"

    script_language      = "JAVASCRIPT"
    runtime_type         = "NODE_API"
    runtime_type_version = "16.10"
  }

  monitor2 = {
    status           = "ENABLED"
    name             = "script_monitor"
    type             = "SCRIPT_API"
    locations_public = ["AP_SOUTH_1", "AP_EAST_1"]
    period           = "EVERY_6_HOURS"

    script = "console.log('it works!')"

    script_language      = "JAVASCRIPT"
    runtime_type         = "NODE_API"
    runtime_type_version = "16.10"
  }
}

