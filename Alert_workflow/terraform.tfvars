Workflow = {
  name        = "foo"
  type        = "apm_app_metric"
  metric      = "apdex"
  runbook_url = "https://www.example.com"
  condition_scope = "application"
  duration      = 5
  operator      = "below"
  priority      = "critical"
  threshold     = "0.75"
  time_function = "all"

}