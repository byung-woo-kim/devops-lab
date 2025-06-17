pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo '🔧 Building Docker image...'
                sh 'docker build -t my-python-app .'
            }
        }

        stage('Test with Pytest') {
            steps {
                echo '🧪 Running pytest...'
                // pytest를 Docker 컨테이너에서 실행
                sh 'docker run --rm my-python-app pytest test_app.py'
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

        stage('Save Artifacts') {
            steps {
                echo '📦 Archiving build artifacts...'
                sh 'touch output.txt'
                archiveArtifacts artifacts: 'output.txt', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline finished successfully.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}

