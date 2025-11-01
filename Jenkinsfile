pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-northeast-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/graj902/terraform-aws-vpc-ec2.git'
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan Apply') {
            steps {
                sh 'terraform plan -var-file=terraform.tfvars -out=tfplan_apply'
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan_apply'
            }
        }
    }

    post {
        always {
            echo 'Cleaning workspace...'
            deleteDir()
        }
    }
}
