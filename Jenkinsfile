node {
  tools {
    maven 'Maven'
  }
  stages {
    stage('Build') {
        }
        steps {
              sh 'docker build -t ggenom3/main:1.1 .'
            }
        }
    stage('Test') {
          steps {
              sh 'mvn clean test'
            }
        }
    stage('Deploy') {
          steps {
              sh 'docker-compose up -d'
            }
        }
    }
}
