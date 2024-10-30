# Jenkins

## Example
Example Declarative Pipeline in Jenkins
```
pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
```

Jenkinsfile to pull from git, build and deploy to kubernetes
```
pipeline {
    agent any   
    stages {
        stage('Git') {
            steps {
                git branch: 'main', url: 'https://git-repo-url'
            }
        }

        stage('Build image') {
            steps {
                sh 'docker build -t helloworld .'
            }

        stage('Push') {
            steps {
                sh 'docker push helloworld'
            }
        }

        stage('Deploy') {
            steps {
                // Update kubernetes manifest
                // Kubernetes credential
                sh 'kubectl apply -f helloworld.yaml'
            }
        }
    }
}
```

### Key Component of Jenkinsfile
- pipeline: Define the pipeline itself
- agent: Where the pipeline run
- stage: Different phase of pipeline, like build, test, deploy
- step: Task to be perform in each stage

## Why use Jenkinsfile
- Pipeline as code
- Consistency and version control
- Automation
- Reusability