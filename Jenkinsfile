pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // specify the AWS region
        TF_VAR_access_key = credentials('AWS_ACCESS_KEY_ID') // Jenkins credentials ID
        TF_VAR_secret_key = credentials('AWS_SECRET_ACCESS_KEY') // Jenkins credentials ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the Terraform code from the repository
                checkout scm
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    dir('terraform') {
                        bat 'terraform init -input=false'
                    }
                }
            }
        }

        stage('Validate Configuration') {
            steps {
                script {
                    dir('terraform') {
                        bat 'terraform validate'
                    }
                }
            }
        }

        stage('Plan Infrastructure') {
            steps {
                script {
                    dir('terraform') {
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Apply Infrastructure') {
            steps {
                script {
                    dir('terraform') {
                        bat 'terraform apply -input=false tfplan'
                    }
                }
            }
        }
    }
}
