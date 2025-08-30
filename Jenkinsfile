pipeline {
  agent any

  stages {
    stage('Diagnóstico') {
      steps {
        sh 'whoami && id && pwd'
        sh 'docker version'
      }
    }

    stage('Maven Build (docker run)') {
      steps {
        sh '''
          echo "PWD=$PWD"
          docker run --rm -u 0:0 \
            -v "$PWD":/ws \
            -v "$HOME/.m2":/root/.m2 \
            -w /ws \
            maven:3.9.6-eclipse-temurin-17 \
            mvn -U clean package -DskipTests -Dcheckstyle.skip=true -B
        '''
        sh 'ls -la target || true'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t petclinic:latest .'
      }
    }
  }
}
