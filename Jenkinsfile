pipeline {
    agent any

    environment {
        # Automatically inject AWS creds using Jenkins credentials plugin
        AWS_REGION = 'ap-south-a'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "📥 Cloning Terraform AWS Infra Repo"
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh 'terraform plan -var-file="labsquire.tfvars" -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput', message: 'Proceed with Terraform Apply?', parameters: [
                            [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'confirm']
                        ]
                    )
                    if (userInput == true) {
                        withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: 'aws-creds'
                        ]]) {
                            sh 'terraform apply -auto-approve tfplan'
                        }
                    } else {
                        echo "🛑 Terraform apply skipped by user."
                    }
                }
            }
        }

        stage('Terraform Output') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh 'terraform output'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform Infrastructure successfully created!"
        }
        failure {
            echo "❌ Terraform pipeline failed!"
        }
    }
}
