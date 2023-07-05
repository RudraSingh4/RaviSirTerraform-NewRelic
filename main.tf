resource "newrelic_alert_policy" "alert" {
  name = "Rudra"
}
# Add a condition
resource "newrelic_nrql_alert_condition" "Test" {
  count                        = length(var.data)
  policy_id                    = newrelic_alert_policy.alert.id
  type                         = "static"
  name                         = var.data[count.index]["name"]
  description                  = var.data[count.index]["description"]
  runbook_url                  = var.data[count.index]["runbook_url"]
  enabled                      = var.data[count.index]["enabled"]
  violation_time_limit_seconds = var.data[count.index]["violation_time_limit_seconds"]
  nrql {
    query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMzUyOHxJTkZSQXxOQXwyMjc2MjE3MDc2MTMwMzAzMTA'"
  }
  critical {
    operator              = var.data[count.index]["operator"]
    threshold             = var.data[count.index]["threshold"]
    threshold_duration    = var.data[count.index]["threshold_duration"]
    threshold_occurrences = var.data[count.index]["threshold_occurrence"]
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
