pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-northeast-1'
        TF_WORKSPACE = 'default'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/graj902/terraform-aws-vpc-ec2.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh '''
                terraform init -input=false
                '''
            }
        }

        stage('Validate Terraform') {
            steps {
                sh '''
                terraform validate
                '''
            }
        }

        stage('Plan Infrastructure') {
            steps {
                sh '''
                terraform plan -input=false -out=tfplan
                '''
            }
        }

        stage('Manual Approval') {
            steps {
                script {
                    def userInput = input(id: 'Proceed', message: 'Do you want to apply the Terraform plan?', parameters: [booleanParam(defaultValue: true, description: 'Apply Terraform changes?', name: 'Proceed')])
                    if (!userInput) {
                        error "Pipeline aborted by user."
                    }
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                sh '''
                terraform apply -input=false -auto-approve tfplan
                '''
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            deleteDir()
        }
        success {
            echo '✅ Terraform apply completed successfully!'
        }
        failure {
            echo '❌ Terraform pipeline failed.'
        }
    }
}
