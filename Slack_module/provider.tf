terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.26.0"
    }
  }
}

provider "newrelic" {
  # Configuration options
  account_id = 3931862
  api_key    = "NRAK-6WUICXSHNPWE1LJ0HM7CH3KCW8Y"
  region     = "US"
}