def userName = 'princenoble'
def appName = 'ui'
pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "${userName}/${appName}-${namespace}:${version}"
        DOCKER_URL = "https://hub.docker.com"
        APP_NAME = "my-app"
    }
    stages {
        stage('Build image') {
            steps {
                script {
                    // Build the Docker image
                     docker.build(DOCKER_IMAGE_NAME, "--platform linux/amd64 --build-arg imageTag=${imageTag} --build-arg imageVersion=${imageVersion} -f Dockerfile .")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    
                    withDockerServer([credentialsId: 'princenoble']) {
                        withDockerRegistry([url: 'https://index.docker.io/v1/', credentialsId: 'princenoble']) {
                            sh "docker --log-level=debug push ${DOCKER_IMAGE_NAME}"
                        }
                    }
                }
            }
        }
        stage('Create GKS deployment') {
            steps {
                script {
                    // Run the Docker container
                    "sh kubectl create deployment ${APP_NAME} --image=${DOCKER_IMAGE_NAME}"
                }
            }
        }
        stage('Expose GKS deployment') {
            steps {
                script {
                    // Run the Docker container
                   "kubectl expose deployment ${APP_NAME} --type=LoadBalancer --port=3000"
                }
            }
        }
    }
}
