# Argo CD

## Installation

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Port Forwarding
Kubectl port-forwarding can also be used to connect to the API server without exposing the service.

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

## Login

The initial password for the `admin` account is auto-generated. And stored in secret `argocd-initial-admin-secret` field `password`. You can simply retrieve this password using the `argocd` CLI:

```bash
argocd admin initial-password -n argocd
```


[^1]: [Doc - ArgoCD](https://argo-cd.readthedocs.io/en/stable/getting_started/)