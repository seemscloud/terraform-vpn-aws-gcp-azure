# Terragrunt VPN AWS - GCP - Azure

## Execution

```bash
# export OPERATION="apply"
export OPERATION="destroy"

terragrunt run-all "${OPERATION}" \
  --terragrunt-parallelism 10 \
  --terragrunt-non-interactive \
  --terragrunt-working-dir 'environments/aws/theanotherwise/eu-central-1/prod' \
  --terragrunt-include-dir '../../../../gcp/theanotherwise/europe-central2/prod/*' \
  --terragrunt-include-dir '../../../../aws/theanotherwise/eu-central-1/prod/*'
```

```bash
  --terragrunt-include-dir '../../../../aws/theanotherwise/eu-central-1/prod/vpn-connection' \
  --terragrunt-strict-include
```

```bash
terragrunt run-all "${OPERATION}" \
  --terragrunt-parallelism 10 \
  --terragrunt-non-interactive \
  --terragrunt-working-dir 'environments/gcp/theanotherwise/europe-central2/prod'
```

## Debugging

```bash
terragrunt state mv  \
  'google_compute_network.compute_network["2"]' \
  'google_compute_network.compute_network["1"]'
```

#### Check

```bash
terragrunt state list

terragrunt state pull
```
