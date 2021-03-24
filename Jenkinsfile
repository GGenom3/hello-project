pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ggenom3/main . '
            }
        }
    }
}
