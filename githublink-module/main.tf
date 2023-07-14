module "newrelic" {
    source = "git::https://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@github.com/RudraSingh4/Newrelic_Alert.git"

    application_name = var.application_name
    account_id = var.account_id
    policy_name = var.policy_name
    Name = var.Name
}