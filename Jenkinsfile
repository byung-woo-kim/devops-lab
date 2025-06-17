pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo '🔧 Building Docker image...'
                sh 'docker build -t my-python-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo '🚀 Running Docker container...'
                sh '''
                    docker rm -f my-running-app || true
                    docker run -d --name my-running-app -p 8000:8000 my-python-app
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Docker container is running.'
        }
        failure {
            echo '❌ Docker build or run failed.'
        }
    }
}

