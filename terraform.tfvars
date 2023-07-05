value=[
    {
        account_id                   = "3931862",
Name                         = "rudra 1", 
description                  = "Alert when transactions are taking too long",
url                          = "https://www.example.com",
violation_time_limit_seconds = "3600",
operator                     = "above",
threshold                    = "5.5",
threshold_duration           = "300",
threshold_occurrences        = "ALL",
enabled                      = "true",
policy_name                  = "rudra-alert"
    },

   {
        account_id                   = "3931862",
Name                         = ["rudra 1", "rudra 2"],
description                  = "Alert when transactions are taking too long",
url                          = "https://www.example.com",
violation_time_limit_seconds = "3600",
operator                     = "above",
threshold                    = "5.5",
threshold_duration           = "300",
threshold_occurrences        = "ALL",
enabled                      = "true",
policy_name                  = "rudra-alert"
    }
]
