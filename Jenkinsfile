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

        stage('User Choice') {
            steps {
                script {
                    // Ask user whether to apply or destroy
                    ACTION = input(
                        id: 'TerraformAction', message: 'Choose Terraform Action:',
                        parameters: [
                            choice(name: 'Action', choices: ['apply', 'destroy'], description: 'Select whether to apply or destroy infrastructure')
                        ]
                    )
                }
            }
        }

        stage('Terraform Execution') {
            steps {
                script {
                    if (ACTION == 'apply') {
                        echo " Applying Terraform changes..."
                        sh 'terraform plan -var-file=terraform.tfvars -out=tfplan_apply'
                        sh 'terraform apply -auto-approve tfplan_apply'
                    } else if (ACTION == 'destroy') {
                        echo " Destroying Terraform resources..."
                        sh 'terraform destroy -auto-approve -var-file=terraform.tfvars'
                    }
                }
            }
        }
    }

    post {
        always {
            echo '🧹 Cleaning workspace...'
            deleteDir()
        }
    }
}
