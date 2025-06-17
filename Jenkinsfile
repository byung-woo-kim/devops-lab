pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo '📥 Cloning repository...'
            }
        }

        stage('Build') {
            steps {
                echo '🔨 Building the project...'
                sh 'echo build completed'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'echo test passed'
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Deploying...'
                sh 'echo deployed successfully'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}

