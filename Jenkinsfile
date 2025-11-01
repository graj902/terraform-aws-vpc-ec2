pipeline {
    agent any

    environment {
        AWS_REGION   = "ap-northeast-1"
        ENVIRONMENT  = "prod"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Create tfvars') {
            steps {
                sh '''
                echo "Creating terraform.tfvars..."
                cat <<EOF > terraform.tfvars
                project_name   = "devops-${ENVIRONMENT}"
                environment    = "${ENVIRONMENT}"
                region         = "${AWS_REGION}"
                vpc_name       = "devops-${ENVIRONMENT}-vpc"
                vpc_cidr       = "10.0.0.0/16"
                public_subnet_cidr = "10.0.1.0/24"
                availability_zone  = "ap-northeast-1a"
                instance_type      = "t3.micro"
                ami_id             = "ami-0a7b961e13d2f9a8a"
                key_name           = "portfolio-key"
                allow_ssh_cidr     = "0.0.0.0/0"

                common_tags = {
                  Managedby   = "Jenkins"
                  owner       = "Gururaj Rathod"
                  environment = "${ENVIRONMENT}"
                  Project     = "terraform-aws-vpc-ec2"
                }
                EOF

                echo "✅ terraform.tfvars created successfully"
                cat terraform.tfvars
                '''
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -input=false -var-file=terraform.tfvars -out=tfplan'
            }
        }

        stage('Apply') {
            steps {
                input message: 'Proceed to apply Terraform?', ok: 'Apply'
                sh 'terraform apply -input=false tfplan'
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            deleteDir()
        }
    }
}
