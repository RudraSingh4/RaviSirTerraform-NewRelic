# API BROWSER 
resource "newrelic_synthetics_script_monitor" "monitor" {
  for_each = var.api-monitor
  status               = each.value.status
  name                 = each.value.name
  type                 = each.value.type
  locations_public     = [for i in each.value.locations_public:i]
  period               = each.value.period
  script               = each.value.script
  script_language      = each.value.script_language
  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version

}

# SCRIPT SCRIPT_BROWSER 
# resource "newrelic_synthetics_script_monitor" "monitor1" {
#     for_each = var.browser-monitor
#   status           = each.value.status
#   name             = each.value.name
#   type             = each.value.type
#   locations_public = [for i in each.value.locations_public:i]
#   period           = each.value.period

#   enable_screenshot_on_failure_and_script = false

#   script = var.value.script

#   runtime_type_version = each.value.runtime_type_version
#   runtime_type         = each.value.runtime_type
#   script_language      = each.value.script_language

#   tag {
#     key    = "some_key"
#     values = ["some_value"]
#   }
# }


