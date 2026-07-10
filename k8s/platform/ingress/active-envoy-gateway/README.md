# Active: Envoy Gateway API

This is the active lower-cost Gateway API implementation for LaunchMyWork.

Current architecture:

Cloudflare
-> Azure LoadBalancer
-> Envoy Gateway
-> Gateway API
-> HTTPRoute
-> Service
-> Pod

Why Envoy Gateway:
AKS is using Azure CNI Powered by Cilium for the dataplane, but AKS-managed Cilium does not expose a Cilium GatewayClass by default. Envoy Gateway keeps the modern Gateway API model without using Azure Application Gateway for Containers.

Previous AGC architecture is archived under:
- k8s/platform/gateway-agc-archived
- k8s/platform/alb-agc-archived

=========

How to install the controller:
helm upgrade --install envoy-gateway `
  oci://docker.io/envoyproxy/gateway-helm `
  --version v1.5.0 `
  --namespace envoy-gateway-system `
  --create-namespace

kubectl wait --timeout=5m `
  -n envoy-gateway-system `
  deployment/envoy-gateway `
  --for=condition=Available
