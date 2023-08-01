workflow = {
    name            = "alert_condition"
    type            = "apm_app_metric"
    metric          = "apdex"
    runbook_url     = "https://www.example.com"
    condition_scope = "application"
    duration        = 5
    operator        = "above"
    priority        = "critical"
    threshold       = "0"
    time_function   = "all"
    account_id      = 3931862
    name1            = "email-example"
    type1            = "EMAIL"
    account_id1      = 3931862
    name2            = "email-example"
    type2            = "EMAIL"
    
    product         = "IINT"
  }
  

