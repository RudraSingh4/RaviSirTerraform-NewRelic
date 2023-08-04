# data "newrelic_entity" "my_app" {
#     for_each = var.practice
#   name   = each.value.name
#   type   = each.value.type
#   domain = each.value.domain

# }

resource "newrelic_alert_policy" "alert_policy" {
  name = var.practice["name"]
}
#   resource "newrelic_alert_condition" "foo" {
#   policy_id = newrelic_alert_policy.alert_policy.id

#   name        = "foo"
#   type        = "apm_app_metric"
#   entities    = [data.newrelic_entity.app.application_id]
#   metric      = "apdex"
#   runbook_url = "https://www.example.com"
#   condition_scope = "application"

#   term {
#     duration      = 5
#     operator      = "below"
#     priority      = "critical"
#     threshold     = "0.75"
#     time_function = "all"
#   }
# }


# # create alert condition 
# resource "newrelic_alert_condition" "condition" {
#     for_each = var.practice
#   policy_id       = each.value.policy_id
#   name            = each.value.name1
#   type            = each.value.type1
#   entities        = each.value.entities
#   metric          = each.value.metric
#   condition_scope = each.value.condition_scope

#   term {
#     duration      = 5
#     operator      = "below"
#     priority      = "critical"
#     threshold     = "0.75"
#     time_function = "all"
#   }
# }

# # create notification destination 
# resource "newrelic_notification_destination" "foo" {
#     for_each = var.practice
#   account_id = each.value.account_id
#   name = each.value.name2
#   type = each.value.type2

#   property {
#     key = each.value.key
#     value = each.value.value
#   }
# }
# #  create a notification channel 
# resource "newrelic_notification_channel" "foo" {
#     for_each = var.practice
#   account_id = each.value.account_id1
#   name = each.value.name3
#   type = each.value.type3
#   destination_id = each.value.destination_id
#   product = each.value.product

#   property {
#     key = "subject"
#     value = "New Subject Title"
#   }

#   property {
#     key = "customDetailsEmail"
#     value = "issue id - {{issueId}}"
#   }
# }


