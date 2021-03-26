node {
  tools {
    maven 'Maven'
  }
  stages {
    stage('Build') {
              sh 'docker build -t ggenom3/main:1.1 .'
        }
    stage('Test') {
              sh 'mvn clean test'
           
        }
    stage('Deploy') {
            def docker = 'docker-compose up -d'
            sshagent(['71c06de5-b707-4568-ac42-0ee1cf7739cc']) {
              sh 'ssh -o StrictHostKeyChecking=no main@172.31.77.151 ${docker}'
            }
      }
    }
}
