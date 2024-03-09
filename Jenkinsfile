pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'eu-central-1'
        TF_VAR_aws_access_key = credentials('aws-access-key')
        TF_VAR_aws_secret_key = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout 
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

        stage('Install Docker') {
            steps {
                script {
                    // Assuming instance IP is stored in some output variable of Terraform
                    def instanceIP = sh(script: 'terraform output instance_ip', returnStdout: true).trim()
                    sshagent(['your-ssh-key']) {
                        sh "ssh ec2-user@${instanceIP} 'sudo yum install -y docker'"
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up Terraform files
            deleteDir()
        }
    }
}
