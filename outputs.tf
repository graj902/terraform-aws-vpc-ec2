# VPC ID
output "vpc_cidr" {
  description = "the id of the created vpc"
  value       = aws_vpc.main.id

}
# subnet ID
output "public_subnet_id" {
  description = "the id of the created public subnet"
  value       = aws_subnet.public.id

}
# EC2 instance ID
output "ec2_instance_id" {
  description = "the id of the created ec2 instance"
  value       = aws_instance.web[*].id

}
# public ip of ec2 instance
output "public_ip" {
  description = "the public ip of the created ec2 instance"
  value       = aws_instance.web[*].public_ip


}
# public DNS of ec2 instance
output "public_dns" {
  description = "the public DNS of the created ec2 instance"
  value       = aws_instance.web[*].public_dns

}