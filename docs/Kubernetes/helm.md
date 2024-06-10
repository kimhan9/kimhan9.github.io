# Helm

- Helm is package manager for Kubernetes.
- Helm Chart is bundle with one or more Kubernetes manifests.
- Chart allow to version your manifest files.
- Helm keep release history of all deployed charts.

## Basic commands

- Search repo
```
helm search repo <keyword>
```

- Install
```
helm install <my-name> <chart-name>
```

- Get manifest of installed charts
```
helm get manifest <my-chart>
```

- Uninstall
```
helm uninstall <my-chart>
```

## How to create Helm Chart

- Tutorial: https://helm.sh/docs/chart_template_guide/getting_started/
- Run `helm create <chart-name>` to create template.
- Go `templates` folder. Some general `deployment.yaml`, `service.yaml` has created.

### Debugging

- Verify chart if follows best proactices
```
helm lint
``` 

- Rendering chart locally
```
helm template --debug
```

- Dry run install
```
helm install --dry-run --debug <my-chart> ./<chart-dolder>
```

- Package the chart to distrbute
```
helm package ./hello-world
```

## kube-prometheus-stack

The stack come with:
- prometheus: Core component. Metric collection engine that collect metrics from the agent.
- alertmanager: Send alert notification when metrics reach alarm state.
- grafana: Visualization of metrics.
- node-exporter: Export node metrics like load average, CPU, memory, storage performance.
- kube-state-exporter: Export metrics directly from Kubernetes API server. Generate metrics above internal Kubernetes objects such as deployment, service, node, pod.
- prometheus operator: Simplify and automate stack setup. Uses Kubernetes Custom Resource Definition (CRD) to manage Prometheus, alertmanager, and related components.