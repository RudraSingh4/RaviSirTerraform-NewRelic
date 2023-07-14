variable "application_name" {
  description = "The name of the New Relic application to monitor"
  type        = string
  
}

variable "account_id" {
  description = "The account ID the application reports to"
  type        = number
 
}

variable "policy_name" {
  description = "The name of the alert policy to manage"
  type        = string

}

variable "Name" {
  type = list(any)
}