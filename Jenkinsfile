pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/awslinuxdevops/terraform-jenkins-aws.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

    }

    post {
        always {
            echo 'Terraform execution Completed!'
        }
    }
}