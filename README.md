```bash
terragrunt run-all plan --terragrunt-non-interactive

terragrunt state mv  \
  'google_compute_network.compute_network["2"]' \
  'google_compute_network.compute_network["1"]'

terragrunt state list

terragrunt state pull
```