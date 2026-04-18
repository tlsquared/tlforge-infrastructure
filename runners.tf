module "runner" {
  source = "./modules/runner"

  for_each = {
    for runner in var.runners: runner.uuid => runner.token
  }

  uuid  = each.key
  token = each.value
}
