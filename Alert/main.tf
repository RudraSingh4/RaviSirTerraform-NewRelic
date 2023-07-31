resource "newrelic_alert_policy" "alert" {
  name = "Rudra"
}
# Add a condition
resource "newrelic_nrql_alert_condition" "Test" {
  count                        = length(var.value)
  policy_id                    = newrelic_alert_policy.alert.id
  type                         = "static"
  name                         = var.value[count.index]["Name"]
  description                  = var.value[count.index]["description"]
  runbook_url                  = var.value[count.index]["url"]
  enabled                      = var.value[count.index]["enabled"]
  violation_time_limit_seconds = var.value[count.index]["violation_time_limit_seconds"]
  nrql {
    query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"
  }
  critical {
    operator              = var.value[count.index]["operator"]
    threshold             = var.value[count.index]["threshold"]
    threshold_duration    = var.value[count.index]["threshold_duration"]
    threshold_occurrences = var.value[count.index]["threshold_occurrences"]
  }
}
/*
resource "newrelic_nrql_alert_condition" "SecondTest" {

  policy_id = newrelic_alert_policy.alert.id

  type = "static"

  name = "SecondTest"

  description = "Alert when transactions are taking too long"

  runbook_url = "https://www.example.com"

  enabled = true

  violation_time_limit_seconds = 3600


  nrql {

    query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"

  }

 warning {

    operator = "above"

    threshold = 5.5

    threshold_duration = 300

    threshold_occurrences = "ALL"

  }

}
*/
