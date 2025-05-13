pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'richardthe1stt/java-calculator-app'
        DOCKER_CREDENTIALS_ID = 'docker-credentials'
    }
    stages {
        // Stage 1: Clone Repository
        stage('Clone Code') {
            steps {
                git branch: 'latest',
                     url: 'https://github.com/richardthe1stt/JavaWeb3.git'
            }
        }
        // Stage 2: Build Docker Image
        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }
        // Stage 3: Push to Docker Hub
        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").push()
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }
}

