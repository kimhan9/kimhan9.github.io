# Argo CD

## Installation

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Access Argo CD

By default, the Argo CD API server is not exposed with an external IP. To access the API server,
choose one of the following techniques to expose the Argo CD API server[^1]:

### Service Type Load Balancer
Change the argocd-server service type to `LoadBalancer`:

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### Port Forwarding
Kubectl port-forwarding can also be used to connect to the API server without exposing the service.

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

The API server can then be accessed using `https://localhost:8080`

## Login

The initial password for the `admin` account is auto-generated and stored as
clear text in the field `password` in a secret named `argocd-initial-admin-secret`
in your Argo CD installation namespace. You can simply retrieve this password
using the `argocd` CLI:

```bash
argocd admin initial-password -n argocd
```


[^1]: [ArgoCD doc](https://argo-cd.readthedocs.io/en/stable/getting_started/)