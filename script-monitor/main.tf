# API BROWSER 
resource "newrelic_synthetics_script_monitor" "monitor006" {
  for_each = var.api-monitor
  status               = each.value.status
  name                 = each.value.name
  type                 = each.value.type
  locations_public     = each.value.location_public
  period               = each.value.period
  script = file("1st.js")
  script_language      = each.value.script_language
  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version

}

# SCRIPT SCRIPT_BROWSER 
resource "newrelic_synthetics_script_monitor" "monitor007" {
    for_each = var.browser-monitor
  status           = each.value.status
  name             = each.value.name
  type             = each.value.type
  locations_public = each.value.locations_public
  period           = each.value.period

  enable_screenshot_on_failure_and_script = false

 script = file("2nd.js")


  runtime_type_version = each.value.runtime_type_version
  runtime_type         = each.value.runtime_type
  script_language      = each.value.script_language

  tag {
    key    = "some_key"
    values = ["some_value"]
  }
}


