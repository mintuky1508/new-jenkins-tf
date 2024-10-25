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
                // Clone the specified GitHub repository
                git url: 'https://github.com/mintuky1508/new-jenkins-tf.git', branch: 'main'
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    dir('terraform') { // Ensure you're in the correct directory
                        bat 'terraform init -input=false'
                    }
                }
            }
        }

        stage('Validate Configuration') {
            steps {
                script {
                    dir('terraform') { // Ensure you're in the correct directory
                        bat 'terraform validate'
                    }
                }
            }
        }

        stage('Plan Infrastructure') {
            steps {
                script {
                    dir('terraform') { // Ensure you're in the correct directory
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Apply Infrastructure') {
            steps {
                script {
                    dir('terraform') { // Ensure you're in the correct directory
                        bat 'terraform apply -input=false tfplan'
                    }
                }
            }
        }
    }
}
