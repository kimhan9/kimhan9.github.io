# Minikube

- Installation: `brew install minikube`
- Start cluster: `minikube start`
- Check status: `minikube status`

## Method 1: Install Prometheus & Grafana

- Create namespace
kubectl create namespace monitoring

- Deploy prometheus-config.yaml
kubectl apply -f https://gist.githubusercontent.com/kimhan9/39227155606edc9830a6274a986bafa6/raw/8c0a821408a76ae0d767fd244ef262ca600f7776/prometheus-config.yaml -n monitoring

- Deploy prometheus-deployment.yaml
kubectl apply -f https://gist.githubusercontent.com/kimhan9/350fafed9ed9511e38675e56d4c712b4/raw/e52d1651a9faa147fa03607e1650c69830b0c15a/prometheus-deployment.yaml -n monitoring

- Deploy prometheus-service.yaml
kubectl apply -f https://gist.githubusercontent.com/kimhan9/15f9f79bf626d60163a0cfdc1eef7848/raw/b5f61ae424a51c166feed4a935e1c089718e485b/prometheus-service.yaml -n monitoring

- Install grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana --namespace monitoring
kubectl get pods -n monitoring

- Access Grafana
kubectl get service -n monitoring
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext -n monitoring
minikube service grafana-ext
Import Grafana ID: 315

## Method 2: Install Prometheus & Grafana

- Deploy Google Demo Services
`kubectl apply -f config-microservices.yaml`

- Set up Helm. Add Prometheus community repo
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

- Install Prometheus and Grafana
```
kubectl create namespace monitoring
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring
kubectl get pods -n monitoring
kubectl get svc -n monitoring
```

- Access Prometheus and Grafana
```
kubectl port-forward service/monitoring-kube-prometheus-prometheus -n monitoring 9090:9090 &
kubectl port-forward service/monitoring-grafana 8080:80 -n monitoring &
```

- Grafana login
```
Username: admin
Password: prom-operator
```