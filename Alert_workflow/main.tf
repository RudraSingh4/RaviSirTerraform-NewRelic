data "newrelic_entity" "app" {
  name = "FoodMe"
  type = "APPLICATION"
  domain = "APM"
}

resource "newrelic_alert_policy" "Rudra_alert" {
  name = "Rudra_alert"
}

resource "newrelic_alert_condition" "foo" {
  policy_id = newrelic_alert_policy.Rudra_alert.id

  name        = var.Workflow["name"]
  type        = var.Workflow["type"]
  entities    = [data.newrelic_entity.app.application_id]
  metric      = var.Workflow["metric"]
  runbook_url = var.Workflow["runbook_url"]
  condition_scope = var.Workflow["condition_scope"]

  term {
    duration      = var.Workflow["duration"]
    operator      = var.Workflow["operator"]
    priority      = var.Workflow["priority"]
    threshold     = var.Workflow["threshold"]
    time_function = var.Workflow["time_function"]
  }
}