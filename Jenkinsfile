#!groovy
pipeline {
  agent {
    docker {
      image 'maven:3.9.6-eclipse-temurin-17'
      args  '--user root:root --volumes-from jenkinsxx -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  options { skipDefaultCheckout(false) }

  stages {
    stage('Diagnóstico rápido') {
      steps {
        sh 'whoami && id && pwd'
        sh 'ls -la'
        sh 'java -version || true'
        sh 'mvn -v'
      }
    }

    stage('Maven Install') {
      steps {
        sh 'mvn -B -DskipTests clean package'
        sh 'ls -la target || true'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker --version'
        sh 'docker build -t petclinic:latest .'
      }
    }
  }
}
