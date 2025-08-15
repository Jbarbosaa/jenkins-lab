pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh './jenkins/build mvn -B -DskipTests clean package'
                sh './jenkins/build/build.sh'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/build/mvn-test.sh mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage ('Push')
            steps {
                sh './jenkins/push/push.sh'
            }
        stage('Deploy') { 
            steps {
                sh './jenkins/deploy/deploy.sh' 
            }
        }
    }
}