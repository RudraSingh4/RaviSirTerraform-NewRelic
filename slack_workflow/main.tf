resource "newrelic_alert_policy" "example1" {
  name = "rudra-policy"
}

resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = 3931862
  policy_id                      = newrelic_alert_policy.example1.id
  type                           = "static"
  name                           = "foo"
  description                    = "Alert when transactions are taking too long"
  runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMTg2MnxJTkZSQXxOQXw2ODI5NTY5OTYwNDkwMzc2NTYw'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_notification_channel" "foo" {
  account_id = 3931862
  name = "slack-example"
  type = "SLACK"
  destination_id = "1fc038ce-4e44-454d-967e-2d533273eee6"
  product = "IINT"

  property {
    key = "channelId"
    value = "C05KRR8GG8K"
  }

  property {
    key = "customDetailsSlack"
    value = "issue id - {{issueId}}"
  }
}

# resource "newrelic_notification_destination" "foo" {
# }

resource "newrelic_workflow" "foo" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
      values = [ newrelic_alert_policy.example1.id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.foo.id
  }
}