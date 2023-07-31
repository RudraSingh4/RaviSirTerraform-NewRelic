resource "newrelic_workload" "workload" {
  for_each   = var.workload
  name       = "Example workload"
  account_id = 3931862

  entity_guids = ["MjUyMDUyOHxBUE18QVBQTElDQVRJT058MjE1MDM3Nzk1"]

  entity_search_query {
    query = var.each.query
  }

  scope_account_ids = [3931862]

  description = "Description"

  status_config_automatic {
    enabled = true
    remaining_entities_rule {
      remaining_entities_rule_rollup {
        strategy        = "BEST_STATUS_WINS"
        threshold_type  = "FIXED"
        threshold_value = 100
        group_by        = "ENTITY_TYPE"
      }
    }
    rule {
      entity_guids = ["MjUyMDUyOHxBUE18QVBQTElDQVRJT058MjE1MDM3Nzk1"]
      nrql_query {
        query = "name like '%Example application2%'"
      }
      rollup {
        strategy        = "BEST_STATUS_WINS"
        threshold_type  = "FIXED"
        threshold_value = 100
      }
    }
  }
} 
