resource "newrelic_workload" "workload" {
  for_each   = var.workload
  name       = each.value.name
  account_id = each.value.account_id

  entity_guids = each.value.entity_guids

  entity_search_query {
    query = each.value.query
  }

  scope_account_ids = each.value.scope_account_ids

  description = each.value.description

  status_config_automatic {
    enabled = true
    remaining_entities_rule {
      remaining_entities_rule_rollup {
        strategy        = each.value.strategy
        threshold_type  = each.value.threshold_type
        threshold_value = each.value.threshold_value
        group_by        = each.value.group_by
      }
    }
    rule {
      entity_guids = each.value.entity_guids
      nrql_query {
        query = each.value.query
      }
      rollup {
        strategy        = each.value.strategy
        threshold_type  = each.value.threshold_type
        threshold_value = each.value.threshold_value
      }
    }
  }
}
