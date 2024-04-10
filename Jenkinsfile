pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("my-app-${namespace}:${version}", '--build-arg imageTag=${imageTag} --build-arg imageVersion=${imageVersion} -f Dockerfile .')
                }
            }
        }
        stage('Create deployment') {
            steps {
                script {
                    // Run the Docker container
                   sh "kubectl create deployment react-${namespace} --image=my-app-${namespace}:${version}"
                }
            }
        }
        stage('Expose deployment') {
            steps {
                script {
                    // Run the Docker container
                   sh "kubectl expose deployment react-${namespace} --type=LoadBalancer --port=3000"
                }
            }
        }
    }
}
