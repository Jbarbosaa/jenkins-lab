pipeline {
    agent any
    environment {
        pass = credentials ('key-dockerhub')
    }
    options {
        skipStagesAfterUnstable()
        timestamps ()
    }
    stages {
        stage('Build') {
            steps {
                sh 'bash pipeline/jenkins/build/mvn.sh -B -DskipTests clean package'
                sh 'bash pipeline/jenkins/build/build.sh'
            }
            post {
                success {
                    archiveArtifacts artifacts: 'pipeline/jenkins/build/app.jar', fingerprint: true
                }
            }
        }
        stage('Test') {
            steps {
                sh 'bash pipeline/jenkins/build/mvn-test.sh mvn test'
                sh 'set -e'
                sh 'mkdir -p pipeline/java-app/target/surefire-reports/'
                sh 'cp -f /var/java-app/target/surefire-reports/*xml pipeline/java-app/target/surefire-reports/ || true'
                sh 'echo Reports copiados para o destino && ls -l pipeline/java-app/target/'
            }
            post {
                always {
                    junit 'pipeline/java-app/target/surefire-reports/*.xml'
                }
            }
        }
        stage ('Push') {
            steps {
                sh 'bash pipeline/jenkins/push/push.sh'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'bash pipeline/jenkins/deploy/deploy.sh' 
            }
        }
    }
}