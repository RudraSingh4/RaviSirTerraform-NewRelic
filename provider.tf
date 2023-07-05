terraform {
  #   required_version = ">= 0.12.6"

  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      #   version = "~> 2.21"
    }
  }
}
# Configure the New Relic provider
provider "newrelic" {
  account_id = 3931862
  api_key    = "NRAK-6WUICXSHNPWE1LJ0HM7CH3KCW8Y" # Usually prefixed with 'NRAK'
  region     = "US"                               # Valid regions are US and EU
}