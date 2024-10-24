# Jenkins

## Example Declarative Pipeline in Jenkins
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