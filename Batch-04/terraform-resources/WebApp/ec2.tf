resource "aws_instance" "lbistech_web_server" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    availability_zone = var.availability_zone_01
    key_name = var.ec2_key

    network_interface {
      device_index = 0
      network_interface_id = aws_network_interface.lbistech_web_server_nic.id
    }

    user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install apache2 -y
                  sudo systemctl start apache2
                  sudo bash -c 'echo Welcome To LbisTech - Terraform part > /var/www/html/index.html'
                  EOF

    tags = {
        "Name" = "${var.name}-web_server"
        "Environment" = "${var.env}"
    }
}