location = "eastus"

resource_group_name = "rg-launchmywork-prod"

acr_name = "acrlaunchmywork"

key_vault_name = "kv-launchmywork-prod"

workload_identity_name = "mi-launchmywork-workloads"

aks_name = "aks-launchmywork-prod"

aks_dns_prefix = "aks-launchmywork-prod"

node_vm_size = "Standard_D2s_v4"

min_count = 1

max_count = 2

tags = {
  project     = "launchmywork"
  environment = "prod"
  managed_by  = "terraform"
}
