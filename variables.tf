# variables.tf - Define input variables for the Terraform configuration
# General configuration 
variable "project_name" {
  description = "Project name to be used as prefix for resources"
  type        = string
  default     = "devops-demo"

}
variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"

}
variable "region" {
  description = "cloud region for resource deployment"
  type        = string
  default     = "ap-northeast-1"

}
# vpc configuration
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "devops-demo-vpc"

}
variable "vpc_cidr" {
  description = "CIDR block for the vpc"
  type        = string
  default     = "10.0.0.0/16"

}
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"

}
variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "ap-northeast-1a"

}
# EC2 configuration
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"

}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0a7b961e13d2f9a8a" # Example AMI ID for Amazon Linux 2 in ap-northeast-1

}
variable "key_name" {
  description = "name of the existing key pair to access ec2 instance"
  type        = string


}
# security configuration
variable "allow_ssh_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "0.0.0.0/0"

}
# Common Tags
variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Owner       = "Gururaj Rathod"
    Environment = "dev"
  }
}