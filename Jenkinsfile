pipeline {
  agent any
  stages {
    stage('Maven Install (inside container)') {
      steps {
        script {
          docker.image('maven:3.9.6-eclipse-temurin-17')
                .inside('--user root:root --volumes-from jenkinsxx -v /var/run/docker.sock:/var/run/docker.sock') {
            sh 'mvn -B -DskipTests clean package'
          }
        }
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t petclinic:latest .'
      }
    }
  }
}
