pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("my-app:${namespace}:${version}", '--build-arg imageTag=${imageTag} --build-arg imageVersion=${imageVersion} -f Dockerfile .')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container
                    docker.image("my-app:${namespace}:${version}").run('-p 3000:3000 -d')
                }
            }
        }
    }
}
