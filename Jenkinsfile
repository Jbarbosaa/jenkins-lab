pipeline {
    agent any
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
        stage('Test') {
            steps {
                sh 'bash pipeline/jenkins/build/mvn-test.sh mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
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