pipeline {
    agent any

    environment {
        // This will be populated by the Jenkins AWS credentials binding
        AWS_ACCESS_KEY_ID = ''
        AWS_SECRET_ACCESS_KEY = ''
        AWS_SESSION_TOKEN = ''
    }

    stages {
        stage('Setup AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    // Inject credentials into environment for all subsequent stages
                    script {
                        env.AWS_ACCESS_KEY_ID = env.AWS_ACCESS_KEY_ID
                        env.AWS_SECRET_ACCESS_KEY = env.AWS_SECRET_ACCESS_KEY
                        env.AWS_SESSION_TOKEN = env.AWS_SESSION_TOKEN
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -lock=false -var-file="labsquire.tfvars" -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
