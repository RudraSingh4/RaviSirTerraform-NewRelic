resource "newrelic_one_dashboard" "exampledash" {
  for_each = var.value
  name        = each.value.name
  permissions = each.value.permissions

  page {
    name = each.value.pagename

    widget_billboard {
      title  = each.value.title
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = each.value.query
      }
    }
     widget_bar {
      title  = each.value.title2
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 3931862
        query      = each.value.query2
      }
    }
  }
}
