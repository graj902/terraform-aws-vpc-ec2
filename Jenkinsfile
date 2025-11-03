pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Select whether to apply (create/update) or destroy the infrastructure'
        )
    }

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

        stage('Plan') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform plan -var-file=terraform.tfvars -out=tfplan_apply'
                    } else {
                        sh 'terraform plan -destroy -var-file=terraform.tfvars -out=tfplan_destroy'
                    }
                }
            }
        }

        stage('Execute') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve tfplan_apply'
                    } else {
                        sh 'terraform apply -auto-approve tfplan_destroy'
                    }
                }
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
