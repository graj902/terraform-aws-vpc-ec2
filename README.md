🚀 Terraform AWS VPC + EC2 Project
🧩 Overview

This project automates the creation of a highly available AWS VPC infrastructure using Terraform. It deploys a custom VPC, public subnet, internet gateway, route table, and multiple EC2 instances — all provisioned in the Tokyo (ap-northeast-1) region.

It’s designed as a real-world DevOps lab to demonstrate Infrastructure as Code (IaC), reusable Terraform modules, and environment-based variable management.

🏗️ Architecture Components

VPC with DNS support and tagging

Public Subnet (auto-assign public IPs)

Internet Gateway for outbound connectivity

Route Table with default route to IGW

Security Group allowing SSH (22) and HTTP (80) access

3 EC2 Instances launched in the public subnet

📂 Terraform Files Overview
File	Description
provider.tf	Configures AWS provider and region
variables.tf	Declares input variables
terraform.tfvars	Holds variable values
main.tf	Core infrastructure logic
outputs.tf	Exports key infrastructure details (VPC ID, EC2 public IPs, etc.)
⚙️ Deployment Steps
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Preview infrastructure changes
terraform plan

# Apply and create resources
terraform apply -auto-approve


To destroy resources:

terraform destroy -auto-approve

🧠 Key Learnings

Managing reusable Terraform files (provider, variables, outputs)

Working with Terraform count to create multiple EC2 instances

Using tags and outputs for resource traceability

Following best practices with .gitignore and state file protection

🌎 Region

Tokyo (ap-northeast-1)

🧑‍💻 Author

Gururaj Rathod
DevOps Engineer | AWS | Terraform | Kubernetes
📧 gururajrathod90@gmail.com

📍 Bangalore, India