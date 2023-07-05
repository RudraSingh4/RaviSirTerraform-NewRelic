value = [
  {
    account_id                  = "3931862"
    Name                         = "rudra 1"
    description                  = "Alert when transactions are taking too long"
    url                          = "https://www.example.com"
    violation_time_limit_seconds = "3200"
    operator                     = "below"
    threshold                    = "3.5"
    threshold_duration           = "3000"
    threshold_occurrences        = "ALL"
    enabled                   = "true"
    policy_name                  = "rudra-alert"
  },

  {
    account_id                  = "3931862"
    Name                         = "rudra 2"
    description                  = "Alert when transactions are taking too long"
    url                          = "https://www.example.com"
    violation_time_limit_seconds = "3600"
    operator                     = "above"
    threshold                    = "5.5"
    threshold_duration           = "2000"
    threshold_occurrences        = "ALL"
    enabled                      = "true"
    policy_name                  = "rudra-alert1"
  },
  {
    account_id                   = "3931862",
    Name                         = "rudra 3",
    description                  = "Alert when transactions are taking too long",
    url                          = "https://www.example.com",
    violation_time_limit_seconds = "600",
    operator                     = "above",
    threshold                    = "5.5",
    threshold_duration           = "2500",
    threshold_occurrences        = "ALL",
    enabled                      = "true",
    policy_name                  = "rudra-alert2"
  }
]
