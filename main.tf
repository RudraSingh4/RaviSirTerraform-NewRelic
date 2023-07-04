resource "newrelic_alert_policy" "alert" {
  name = var.policy_name
}
# Add a condition
resource "newrelic_nrql_alert_condition" "Test" {
  count                        = length(var.Name)
  policy_id                    = newrelic_alert_policy.alert.id
  type                         = "static"
  name                         = var.Name[count.index]
  description                  = var.description
  runbook_url                  = var.url
  enabled                      = var.enabled
  violation_time_limit_seconds = var.violation_time_limit_seconds
  nrql {
    query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"
  }
  critical {
    operator              = var.operator
    threshold             = var.threshold
    threshold_duration    = var.threshold_duration
    threshold_occurrences = var.threshold_occurrences
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
