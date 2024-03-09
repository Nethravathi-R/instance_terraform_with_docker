pipeline {
    agent any
    
    stages {
        stage('Clone repository') {
            steps {
                // Clone your repository from the remote
                git credentialsId: 'your-git-credentials', url: 'https://github.com/Harshahd97/instance_terraform_with_docker.git'
            }
        }
        
        stage('Copy files to workspace') {
            steps {
                // Copy files from your instance to the Jenkins workspace
                sh 'cp -r /home/ubuntu/*'
            }
        }
        
        stage('Commit and push changes') {
            steps {
                // Add files to Git
                sh 'git add .'
                
                // Commit changes
                sh 'git commit -m "Automated commit from Jenkins"'
                
                // Push changes to remote repository
                sh 'git push origin destroy
            }
        }
        stage('Destroy existing instance') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
                
                // Destroy existing instance
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
