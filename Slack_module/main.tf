module "slack_module" {
    source = "./workflow_slack"
    slack = var.slack
    channel_slack = var.channel_slack
    workflow = var.workflow
  
}