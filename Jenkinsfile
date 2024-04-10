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
        stage('Generate and Apply Kubernetes Manifest') {
            steps {
                script {
                    // Generate Kubernetes manifest files
                    writeFile(file: 'deployment.yaml', text: generateDeploymentManifest())
                    // Apply the Kubernetes manifest using kubectl
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
def generateDeploymentManifest() {
    def template = readFile('deployment-template.yaml')
    return template.replaceAll('\\$\\{namespace\\}', "${namespace}")
                   .replaceAll('\\$\\{version\\}', "${version}")
}
