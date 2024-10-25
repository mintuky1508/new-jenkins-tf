pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // specify the AWS region
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID') // Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') // Jenkins credentials ID
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
                    bat 'terraform init -input=false'
                }
            }
        }

        stage('Plan Infrastructure') {
            steps {
                script {
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Infrastructure') {
            steps {
                script {
                    bat 'terraform apply -input=false tfplan'
                }
            }
        }
    }
}
