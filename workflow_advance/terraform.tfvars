
destination = {
  val1 = {
    account_id1 = 3931862
    name2       = "email-example"
    type2       = "EMAIL"
  }
}

channel = {
  val2 = {
    account_id     = 3931862
    name1          = "email-example"
    type1          = "EMAIL"
    # destination_id = "newrelic_notification_destination.notification["val1"].id"
    product        = "IINT"
  }
}

workflow = {
  val = {
    account_id                     = 3931862
    policy_id                      = "newrelic_alert_policy.foo.id"
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
    query                          = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'MzkzMTg2MnxJTkZSQXxOQXw2ODI5NTY5OTYwNDkwMzc2NTYw'"
    operator                       = "above"
    threshold                      = 5.5
    threshold_duration             = 300
    threshold_occurrences          = "ALL"
    operator1                      = "above"
    threshold1                     = 3.5
    threshold_duration1            = 600
    threshold_occurrences1         = "ALL"
    name3                          = "workflow-example"
    muting_rules_handling          = "NOTIFY_ALL_ISSUES"
    # channel_id                     = "newrelic_notification_channel.channel['val2'].id"
  }
}
