pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'sudo docker build -t ggenom3/main . '
            }
        }
    }
}
