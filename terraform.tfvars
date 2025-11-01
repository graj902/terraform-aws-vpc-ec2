# General configuration
project_name = "devops-preprod"
environment  = "preprod"
region       = "ap-northeast-1"
# vpc configuration
vpc_name           = "devops-prod-vpc"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "ap-northeast-1a"
# EC2 configuration
instance_type = "t3.micro"
ami_id        = "ami-0a7b961e13d2f9a8a" # Example AMI ID for Amazon Linux 2 in ap-northeast-1
key_name      = "portfolio-key"

# security group configuration
allow_ssh_cidr = "0.0.0.0/0"

# common tags
common_tags = {
  Managedby   = "Terraform"
  owner       = "Gururaj Rathod"
  environment = "preprod"
  Project     = "terrafrom-aws-vpc-ec2"
}