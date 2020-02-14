pipeline {
    agent any
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    environment {
        PROJECT = "angular-realworld-example-app"
        TARGET_HOST = "app.explorium"
        DOCKER_REGISTRY = "registry.explorium"
        IMAGE = "${DOCKER_REGISTRY}/${PROJECT}"
    }
    stages {
        stage('Build') {
            steps {
                sh script: 'docker build . -t ${IMAGE}'
            }
        }
        stage('Push') {
            steps {
                sh script:  'docker push ${IMAGE}'
            }
        }
        stage('Deploy') {
            steps {
                sh script: '''
                            ssh ${TARGET_HOST} IMAGE=${IMAGE} PROJECT=${PROJECT} 'bash -s' < deploy.sh 
                           '''
            }
        }
    }
}
