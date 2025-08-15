pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
        timestamps ()
    }
    stages {
        stage('Build') {
            steps {
                sh './pipeline/jenkins/mvn.sh -B -DskipTests clean package'
                sh './jenkins/build/build.sh'
            }
        }
        stage('Test') {
            steps {
                sh './pipeline/jenkins/build/mvn-test.sh mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage ('Push') {
            steps {
                sh './pipeline/jenkins/push/push.sh'
            }
        }
        stage('Deploy') { 
            steps {
                sh './pipeline/jenkins/deploy/deploy.sh' 
            }
        }
    }
}