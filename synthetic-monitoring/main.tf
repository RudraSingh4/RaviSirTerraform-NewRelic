resource "newrelic_synthetics_monitor" "monitor" {
  count            = length(var.data1)
  status           = var.data1[count.index]["status"]
  name             = var.data1[count.index]["name"]
  period           = var.data1[count.index]["period"]
  uri              = var.data1[count.index]["uri"]
  type             = var.data1[count.index]["type"]
  locations_public = var.data1[count.index]["locations_public"][count.index][*]

  custom_header {
    name  = "some_name"
    value = "some_value"
  }

  enable_screenshot_on_failure_and_script = true
  validation_string                       = var.data1[count.index]["validation_string"]
  verify_ssl                              = true

  tag {
    key    = "some_key"
    values = ["some_value"]
  }
}

resource "newrelic_synthetics_monitor" "monitor2" {
  count            = length(var.data1)
  status           = var.data2[count.index]["status"]
  name             = var.data2[count.index]["name"]
  period           = var.data2[count.index]["period"]
  uri              = var.data2[count.index]["uri"]
  type             = var.data2[count.index]["type"]
  locations_public = var.data2[count.index]["locations_public"][count.index][*]


  enable_screenshot_on_failure_and_script = true
  validation_string                       = var.data1[count.index]["validation_string"]
  verify_ssl                              = true

}

