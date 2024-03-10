pipeline {
    agent {dockerfile true}

    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-1'
            aws_access_key = credentials('aws-access-key')
            aws_secret_key = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout') {
            steps {
                sh 'rm -rf instance_terraform_with_docker'
                sh 'git clone https://github.com/Harshahd97/instance_terraform_with_docker.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                // Initialize Terraform in the directory where your Terraform configuration files are
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                // Generate and show an execution plan without actually applying it
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform execution plan
                script {
                    sh 'terraform apply tfplan'
                }
            }
        } 
    }
}
