resource "newrelic_alert_policy" "alert_policy" {
    name = "rudra_alert"
  
}

resource "newrelic_alert_condition" "alert_condition" {
    policy_id = newrelic_alert_policy.alert_policy.id 
    
  
}