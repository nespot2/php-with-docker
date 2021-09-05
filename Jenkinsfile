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
         stage('Test') {
                    steps {
                        sh 'echo Test'
                    }

        }
        stage('Build develop') {
                    when { branch 'develop' }
                    steps {
                        sh 'echo build develop'
                    }
        }


        stage('Build master') {
            when { branch 'master' }
            steps {
                sh 'echo build master'
            }
        }
    }
}