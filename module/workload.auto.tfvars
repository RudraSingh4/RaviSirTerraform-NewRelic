
mod4 = {
  w1 = {
    name = "rudra_workload"
    account_id        = 3931862
    entity_guids      = ["MjUyMDUyOHxBUE18QVBQTElDQVRJT058MjE1MDM3Nzk1"]
    query             = "account: 'tag Account 3931862' AND 'tag fullHostname: RUDRASINGH'"
    scope_account_ids = [3931862]
    description       = "Description"
    enabled           = true
    strategy          = "BEST_STATUS_WINS"
    threshold_type    = "FIXED"
    threshold_value   = 100
    group_by          = "ENTITY_TYPE"
    query             = "account: 'tag Account 3931862' AND 'tag fullHostname: RUDRASINGH'"
    strategy          = "BEST_STATUS_WINS"
    threshold_type    = "FIXED"
    threshold_value   = 200

  }
}
