pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                withAWS(credentials:'nespot2-credentials', region: 'ap-northeast-2') {
                    sh 'aws ecr get-login-password --region ap-northeast-2'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'echo hahaha'
            }

        }
    }
}