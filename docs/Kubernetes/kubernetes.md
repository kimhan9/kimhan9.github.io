# Kubernetes

- Pod accessing another pod in another namespace. Use dns eg `curl <service-name>.<namespace>.svc.cluster.local`

## Cheat Sheet
- [Kubernetes Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- [Coursera - Kubernetes Cheat Sheet](https://www.coursera.org/collections/kubernetes-cheat-sheet)
- [A Complete Kubernetes info](https://zeet.co/blog/kubernetes-cheat-sheet)

## Basic yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

## Kubernetes Controller

### ReplicaSets
- Make sure number of replica pod running

### StatefulSet
- Manage stateful applications with persistent storage and stable identities
- Applications like databases (e.g., MySQL, Cassandra) that need persistent storage

### Deployment
- Extension of replicaset which additional feature like rolling update, rollback, versioning

### Daemonset
- Ensure a copy of pod runs on every node within cluster.
- Use case:
    - Log agent to collect log
    - Monitoring agent to monitor node
    - Run specific network plugins
    - Security agent to maintain integrity and security of cluster

## Kubernetes Component

### Master Node
- API Server: Gateway to control panel, handling request
- Scheduler: Assign work, like pod to node
- Controller Manager: Manage controller that regulate state of cluster
- etcd: Key-value store for cluster data

### Worker Node
- Kubelet: Agent that ensure container are run in pod
- Kube-proxy: Manage network communication between pod and external traffic
- Container runtime: Software that run container, eg docker

## Terms
- Node affinity: Control which node your pod can schedule on

## PV and PVC
- PV provide way to store data in cluster.
- PVC request specfic resource from PV.

## Concept of Ingress
- Ingress is an API object that manage external access to services in cluster, typical HTTP. Ingress can provide laod balancing, SSL termination and name-based virtual hosting.

## How to Secure Kubernetes
- Network policy
- Role-based access control (RBAC)
- Secret manager
- Use namspaces
- Secure API servers
- Ensure the cluster is up to date and security patches
