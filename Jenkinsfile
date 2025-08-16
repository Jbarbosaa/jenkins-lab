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
        }
            post {
                success {
                    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }
        stage('Test') {
            steps {
                sh 'bash pipeline/jenkins/build/mvn-test.sh mvn test'
            }
            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
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