resource "newrelic_alert_muting_rule" "foo" {
    name = "Example Muting Rule"
    enabled = true
    description = "muting rule test."
    condition {
        conditions {
            attribute   = var.Mutingrule["attribute1"]
            operator    = var.Mutingrule["operator1"]
            values      = var.Mutingrule["values1"]
        }
        conditions {
            attribute   = var.Mutingrule["attribute2"]
            operator    = var.Mutingrule["operator2"]
            values      = var.Mutingrule["values2"]
        }
        operator = "AND"
    }
    schedule {
      start_time = var.Mutingrule["start_time"]
      end_time = var.Mutingrule["end_time"]
      time_zone = var.Mutingrule["time_zone"]
      repeat = var.Mutingrule["repeat"]
      weekly_repeat_days = var.Mutingrule["weekly_repeat-days"]
      repeat_count = var.Mutingrule["repeat_count"]
    }
}