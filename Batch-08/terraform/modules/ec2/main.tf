resource "aws_instance" "devops-instance01" {
  ami        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name        = "${var.name}-ec2"
    Environment = var.environment_name
    Deployment  = var.deployment_method
  }
}