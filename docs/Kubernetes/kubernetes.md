# Kubernetes

- Pod accessing another pod in another namespace. Use dns eg `curl <service-name>.<namespace>.svc.cluster.local`

## Cheat Sheet

- [Kubernetes Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- [Coursera - Kubernetes Cheat Sheet](https://www.coursera.org/collections/kubernetes-cheat-sheet)
- [A Complete Kubernetes info](https://zeet.co/blog/kubernetes-cheat-sheet)

## Workload Management

### ReplicaSets

- Managed stateless application deployment: scaling, rollout, rollback.
- Make sure identical number of pod running

### StatefulSet

- Manage deployment and scaling of stateful application
- Provide **guarantees of ordering** and **uniqueness** of pod. Each pod maintain sticky identify for stable network and persistent storage.

### Daemonset

- Ensure a specific pod runs on every node within cluster.
- Use case:
    - Log agent to collect log
    - Monitoring agent to monitor node
    - Run specific network plugins
    - Security agent to maintain integrity and security of cluster

## PV and PVC

- PV provide way to store data in cluster.
- PVC request specfic resource from PV.

## Concept of Ingress

- Ingress is an API object that manage external access to services in cluster, typical HTTP. Ingress can provide laod balancing, SSL termination and name-based virtual hosting.

## How to secure Kubernetes

- Network policy
- Role-based access control (RBAC)
- Secret manager
- Use namspaces
- Secure API servers
- Ensure the cluster is up to date and security patches