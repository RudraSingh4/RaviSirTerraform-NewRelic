data "newrelic_entity" "app" {
  name = "FoodMe"
  type = "APPLICATION"
  domain = "APM"
}

resource "newrelic_alert_policy" "Rudra_alert" {
  name = "Rudra_alert"
}

resource "newrelic_alert_condition" "Rudra_condition" {
  policy_id = newrelic_alert_policy.Rudra_alert.id

  name        = "Rudra_condition"
  type        = "apm_app_metric"
  entities    = [data.newrelic_entity.app.application_id]
  metric      = "apdex"
  runbook_url = "https://www.example.com"
  condition_scope = "application"

  term {
    duration      = 5
    operator      = "below"
    priority      = "critical"
    threshold     = "0.75"
    time_function = "all"
  }
}

resource "newrelic_notification_destination" "Destination" {
  account_id = 3931862
  name = "Send-email"
  type = "EMAIL"

  property {
    key = "email"
    value = "rishurudrasingh@gmail.com,poojasangwan2612@gmail.com"
  }
}

resource "newrelic_notification_channel" "Notification" {
  account_id = 3931862
  name = "email-example"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.Destination.id
  product = "IINT"

#   property {
#     key = "subject"
#     value = "New Subject Title"
#   }

  property {
    key = "customDetailsEmail"
    value = "issue id - {{issueId}}"
  }
}

resource "newrelic_workflow" "workflow" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "accumulations.tag.team"
      operator = "EXACTLY_MATCHES"
      values = [ "growth" ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.Notification.id
  }
}