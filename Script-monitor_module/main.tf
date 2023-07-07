module "monitor01" {
  source = "../script-monitor"
  api-monitor = var.api-monitor
  browser-monitor = var.browser-monitor
  
}