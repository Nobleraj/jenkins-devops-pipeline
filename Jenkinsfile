pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('my-app:v1', '-f Dockerfile .')
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container
                    docker.image('my-app:v1').run('-p 3000:3000 -d')
                }
            }
        }
    }
}
