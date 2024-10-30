# Kubernetes

- Pod accessing another pod in another namespace. Use dns eg `curl <service-name>.<namespace>.svc.cluster.local`

## Cheat Sheet

- [Kubernetes Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- [Coursera - Kubernetes Cheat Sheet](https://www.coursera.org/collections/kubernetes-cheat-sheet)
- [A Complete Kubernetes info](https://zeet.co/blog/kubernetes-cheat-sheet)

## Kubernetes Controller

### ReplicaSets

- Make sure number of replica pod running

### StatefulSet

- Manage stateful applications with persistent storage and stable identities
- Applications like databases (e.g., MySQL, Cassandra) that need persistent storage

### Daemonset

- Ensure a copy of pod runs on every node within cluster.
- Use case:
    - Log agent to collect log
    - Monitoring agent to monitor node
    - Run specific network plugins
    - Security agent to maintain integrity and security of cluster

### Deployment

- Extension of replicaset which additional feature like rolling update, rollback, versioning

## Term
- Node affinity: Control which node your pod can schedule on

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