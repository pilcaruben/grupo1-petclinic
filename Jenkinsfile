pipeline {
  agent any

  stages {
    stage('Diagnóstico') {
      steps {
        sh 'whoami && id && uname -a'
        sh 'pwd && ls -la && ls -la "${WORKSPACE}@tmp" || true'
        sh 'docker version'
      }
    }

    stage('Maven Build (inside)') {
      steps {
        script {
          docker.image('maven:3.9.6-eclipse-temurin-17').inside('--user root:root -v /var/run/docker.sock:/var/run/docker.sock') {
            sh 'whoami && pwd'
            sh 'mvn -v'
            sh 'mvn -B -DskipTests clean package'
            sh 'ls -la target || true'
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
