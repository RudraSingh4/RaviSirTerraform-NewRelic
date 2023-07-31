module "resource" {
    source = "./alert"
    value = var.mod1
  
}

module "resource1" {
    source = "./script_monitor"
    value1 = var.mod2
    
      
}

module "synthetic_monitor" {
    source = "./synthetic_monitor"
    data1 = var.mod3
  
}

module "workload" {
    source = "./workload"
    workload = var.mod4

  
}
