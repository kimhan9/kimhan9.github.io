# Sonarqube

## Setup

```docker
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
```

Sonarqube scanner CLI

```
docker run \
    --rm \
    -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=${YOUR_PROJECT_KEY}" \
    -e SONAR_TOKEN="myAuthenticationToken" \
    -v "${YOUR_REPO}:/usr/src" \
    sonarsource/sonar-scanner-cli
```

### Default Login

```
Site: http://localhost:9000
Username: admin
Password: admin
```

### Webook for jenkins

```
http://172.17.0.3:8080/sonarqube-webhook/
```