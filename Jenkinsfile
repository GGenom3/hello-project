node {
    def mvnhome = tool name: 'Maven', type: 'maven'
    def mvncmd = "${mvnhome}/bin/mvn"
    stage ('scm') {
        git branch: 'main', changelog: false, credentialsId: '7a83c10c-8b24-4eba-bf04-e2a084687e17', poll: false, url: 'https://github.com/GGenom3/hello-project.git'
    }
    stage('Build') {
              sh "${mvncmd} clean compile vertx:package"
        }
    stage('Test') {
              sh "${mvncmd} clean test"
           
        }
    stage('Deploy') {
            withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                sh "docker login -u ggenom3 -p ${dockerhub}"
            }
            sh 'docker rmi ggenom3/main'
            sh 'docker build -t ggenom3/main .'
            sh 'docker push ggenom3/main'
            
            def docker = 'docker run -p 8888:8888 -d --name apps ggenom3/main'
            sshagent(['ubntu']) {
              sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.77.151 docker stop apps'
              sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.77.151 docker container rm apps'
              sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.77.151 docker rmi ggenom3/main'
              sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.77.151 docker run -p 8888:8888 -d --name apps --restart always ggenom3/main'
           
            }
    }
}
