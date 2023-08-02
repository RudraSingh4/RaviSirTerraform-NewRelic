resource "newrelic_alert_policy" "foo" {
  name = "foo"
}

resource "newrelic_nrql_alert_condition" "foo" {
  count                          = length(var.slack)
  account_id                     = var.slack[count.index]["account_id"]
  policy_id                      = var.slack[count.index]["policy_id"]
  type                           = var.slack[count.index]["type"]
  name                           = var.slack[count.index]["name"]
  description                    = var.slack[count.index]["description"]
  runbook_url                    = var.slack[count.index]["runbook_url"]
  enabled                        = var.slack[count.index]["enabled"]
  violation_time_limit_seconds   = var.slack[count.index]["violation_time_limit_seconds"]
  fill_option                    = var.slack[count.index]["fill_option"]
  fill_value                     = var.slack[count.index]["fill_value"]
  aggregation_window             = var.slack[count.index]["aggregation_window"]
  aggregation_method             = var.slack[count.index]["aggregation_method"]
  aggregation_delay              = var.slack[count.index]["aggregation_delay"]
  expiration_duration            = var.slack[count.index]["expiration_duration"]
  open_violation_on_expiration   = var.slack[count.index]["open_violation_on_expiration"]
  close_violations_on_expiration = var.slack[count.index]["close_violations_on_expiration"]
  slide_by                       = var.slack[count.index]["slide_by"]

  nrql {
    query = var.slack[count.index]["query"]
  }

  critical {
    operator              = var.slack[count.index]["operator"]
    threshold             = var.slack[count.index]["threshold"]
    threshold_duration    = var.slack[count.index]["threshold_duration"]
    threshold_occurrences = var.slack[count.index]["threshold_occurrences"]
  }

  warning {
    operator              = var.slack[count.index]["operator1"]
    threshold             = var.slack[count.index]["threshold1"]
    threshold_duration    = var.slack[count.index]["threshold_duration1"]
    threshold_occurrences = var.slack[count.index]["threshold_occurrences1"]
  }
}
# create notification channel (slack) 
resource "newrelic_notification_channel" "foo" {
  count          = length(var.channel_slack)
  account_id     = var.channel_slack[count.index]["account_id"]
  name           = var.channel_slack[count.index]["name1"]
  type           = var.channel_slack[count.index]["type1"]
  destination_id = var.channel_slack[count.index]["destination_id"]
  product        = var.channel_slack[count.index]["product"]

  property {
    key   = "channelId"
    value = "123456"
  }

  property {
    key   = "customDetailsSlack"
    value = "issue id - {{issueId}}"
  }
}

resource "newrelic_notification_destination" "foo" {
}

# create workflow 

