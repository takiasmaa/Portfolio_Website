External Secrets Operator is installed with Helm using values.yaml.

Install/update:

helm upgrade --install external-secrets external-secrets/external-secrets `
  --namespace external-secrets `
  --create-namespace `
  -f .\k8s\platform\external-secrets\values.yaml

Then apply the Key Vault store and ExternalSecret:

kubectl apply -k .\k8s\platform\external-secrets