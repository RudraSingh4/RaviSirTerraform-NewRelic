Mutingrule = {
name = "Example Muting Rule"
enabled = true
description = "muting rule test."

attribute1   = "product"
operator1    = "EQUALS"
values1      = ["APM"]

attribute2   = "targetId"
operator2    = "EQUALS"
values2      = ["Muted"]
start_time = "2021-01-28T15:30:00"
end_time = "2021-01-28T16:30:00"
time_zone = "America/Los_Angeles"
repeat = "WEEKLY"
weekly_repeat_days = ["MONDAY", "WEDNESDAY", "FRIDAY"]
}
