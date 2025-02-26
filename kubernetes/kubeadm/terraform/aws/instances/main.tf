provider "aws" {
  region = "eu-central-1"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name  = "k8s-node"
  ami_id         = "ami-07eef52105e8a2059"
  instance_type  = "t3.medium"
  key_name       = "devops-batch08"
  subnet_ids     = ["subnet-0e2a0eea41bf2c884", "subnet-0adc427b44ad55e21", "subnet-07b0ec92b4f2aa455"]
  instance_count = 3

  inbound_from_port  = ["0", "6443", "22", "30000"]
  inbound_to_port    = ["65000", "6443", "22", "32768"]
  inbound_protocol   = ["TCP", "TCP", "TCP", "TCP"]
  inbound_cidr       = ["172.31.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  outbound_from_port = ["0"]
  outbound_to_port   = ["0"]
  outbound_protocol  = ["-1"]
  outbound_cidr      = ["0.0.0.0/0"]
}
