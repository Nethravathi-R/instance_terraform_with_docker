pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform configuration files from version control
                sh 'rm -rf instance_terraform_with_docker'
                git 'https://github.com/Harshahd97/instance_terraform_with_docker.git'
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
