data "newrelic_entity" "app" {
    name = "FoodMe"
    type = "application"
    domain = "APM"
  
}
# create alert policy 

resource "newrelic_alert_policy" "alert_policy" {
    name = "Rudra_alert"
  
}
# create condition 

resource "newrelic_alert_condition" "condition" {
  policy_id = newrelic_alert_policy.alert_policy.id

  name        = var.workflow["name"]
  type        = var.workflow["type"]
  entities        = [data.newrelic_entity.app.application_id]
  metric      = var.workflow["metric"]
  runbook_url = var.workflow["runbook_url"]
  condition_scope = var.workflow["condition_scope"]

  term {
    duration      = var.workflow["duration"]
    operator      = var.workflow["operator"]
    priority      = var.workflow["priority"]
    threshold     = var.workflow["threshold"]
    time_function = var.workflow["time_function"]
  }
}
# create destination 
resource "newrelic_notification_destination" "destination" {
  account_id = var.workflow["account_id"]
  name = var.workflow["name1"]
  type = var.workflow["type1"]

  property {
    key             = "email"
    value           = "rishurudrasingh@gmail.com"
  }
}

# create Notification channel 
resource "newrelic_notification_channel" "channel" {
  account_id = var.workflow["account_id1"]
  name = var.workflow["name2"]
  type = var.workflow["type2"]
  destination_id  = newrelic_notification_destination.destination.id
  product = var.workflow["product"]

  property {
    key = "subject"
    value = "New Subject Title"
  }

  property {
    key = "customDetailsEmail"
    value = "issue id - {{issueId}}"
  }
}

# create workflow
resource "newrelic_workflow" "workflow" {
  name = "rudra_workflow"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "accumulations.sources"
      operator = "EXACTLY_MATCHES"
      values = [ newrelic_alert_policy.alert_policy.id ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.channel.id
  }
}
