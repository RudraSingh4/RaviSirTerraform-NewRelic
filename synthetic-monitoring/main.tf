resource "newrelic_synthetics_monitor" "monitor" {
  for_each = var.data1
  status           = each.value.status
  name             = each.value.name
  period           = each.value.period
  uri              = each.value.uri
  type             = each.value.type
  locations_public = each.value.locations_public

  custom_header {
    name  = "some_name"
    value = "some_value"
  }

  enable_screenshot_on_failure_and_script = true
  validation_string                       = "success"
  verify_ssl                              = true

}

