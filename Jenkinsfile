pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-1'
        TF_VAR_aws_access_key = credentials('aws-access-key')
        TF_VAR_aws_secret_key = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
