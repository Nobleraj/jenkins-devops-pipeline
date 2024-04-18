def userName = 'princenoble'
def appName = 'ui'
pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${userName}/${appName}-${namespace}:${version}", '--build-arg imageTag=${imageTag} --build-arg imageVersion=${imageVersion} -f Dockerfile .')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container
                     sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
