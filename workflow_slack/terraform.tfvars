slack = [
  {
    account_id                     = 3931862
    # policy_id                      = "newrelic_alert_policy.policy1.id"
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
    query                          = "SELECT latest(host.disk.usedPercent) as 'Used %' FROM Metric FACET device WHERE `entityGuid` = 'MzkzMTg2MnxJTkZSQXxOQXw2ODI5NTY5OTYwNDkwMzc2NTYw'"
    operator                       = "above"
    threshold                      = 5.5
    threshold_duration             = 300
    threshold_occurrences          = "ALL"
    operator1                      = "above"
    threshold1                     = 3.5
    threshold_duration1            = 600
    threshold_occurrences1         = "ALL"
  }
]

channel_slack = [
  {
    account_id     = 3931862
    name1          = "slack-example"
    type1          = "SLACK"
    destination_id = "1fc038ce-4e44-454d-967e-2d533273eee6"
    product        = "IINT"
  }
]

workflow = [
  {
    name2                 = "slack_workflow"
    muting_rules_handling = "NOTIFY_ALL_ISSUES"
    channel_id            = "newrelic_notification_channel.foo['channel_slack'].id"
  }
]
