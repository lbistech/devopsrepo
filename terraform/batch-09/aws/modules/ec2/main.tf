resource "aws_instance" "devops-b9-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name        = "${var.instance_name}-ec2"
    Environment = var.environment_name
    Account     = var.account_name
  }
}