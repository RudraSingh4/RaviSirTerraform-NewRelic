resource "newrelic_alert_policy" "policy1" {
  name = "foo"
}

resource "newrelic_nrql_alert_condition" "foo" {
  for_each                       = var.slack
  account_id                     = each.value.account_id
  policy_id                      = newrelic_alert_policy.policy1.id
  type                           = each.value.type
  name                           = each.value.name
  description                    = each.value.description
  runbook_url                    = each.value.runbook_url
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                        = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.query
  }

  critical {
    operator              = each.value.operator
    threshold             = each.value.threshold
    threshold_duration    = each.value.threshold_duration
    threshold_occurrences = each.value.threshold_occurrences
  }

  warning {
    operator              = each.value.operator1
    threshold             = each.value.threshold1
    threshold_duration    = each.value.threshold_duration1
    threshold_occurrences = each.value.threshold_occurrences1
  }
}
# create notification channel (slack) 
resource "newrelic_notification_channel" "foo" {
  for_each       = var.channel_slack
  account_id     = each.value.account_id
  name           = each.value.name1
  type           = each.value.type1
  destination_id = each.value.destination_id
  product        = each.value.product

  property {
    key   = each.value.key
    value = each.value.value
  }

  property {
    key   = "customDetailsSlack"
    value = "issue id - {{issueId}}"
  }
}

# create workflow 
resource "newrelic_workflow" "workflow" {
  for_each              = var.workflow
  name                  = each.value.name2
  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values    = ["newrelic_alert_policy.policy1.id"]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.foo["val2"].id
  }
}
