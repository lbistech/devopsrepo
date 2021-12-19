# 1 - Create VPC
resource "aws_vpc" "lbistech_vpc" {
    cidr_block = var.lbistech_vpc_cidr_block

    tags = {
        "Name" = "${var.name}-vpc"
        "Environment" = "${var.env}"
    }
}

# 2 - Create IGW
resource "aws_internet_gateway" "lbistech-igw" {
    vpc_id = aws_vpc.lbistech_vpc.id
    tags = {
        "Name" = "${var.name}-igw"
        "Environment" = "${var.env}"
    }
}

# 3 - Create Public Subnet
resource "aws_subnet" "lbistech_pub_sn" {
    vpc_id = aws_vpc.lbistech_vpc.id
    cidr_block = var.lbistech_pub_sub_cidr_block
    availability_zone = var.availability_zone_01
    map_public_ip_on_launch=true

    tags = {
        "Name" = "${var.name}-pub-sn-01"
        "Environment" = "${var.env}"
    }
}

# 4 - Create Pub RT
resource "aws_route_table" "lbistech_pub_route_table" {
    vpc_id = aws_vpc.lbistech_vpc.id

    route {
        cidr_block = var.wildcard_cidr
        gateway_id = aws_internet_gateway.lbistech-igw.id
    }

    tags = {
        "Name" = "${var.name}-pub-rt"
        "Environment" = "${var.env}"
    }
}

# 5 - Associate subnet with the route table
resource "aws_route_table_association" "subnet_association" {
    subnet_id = aws_subnet.lbistech_pub_sn.id
    route_table_id = aws_route_table.lbistech_pub_route_table.id
}

# 6 - Create Private Subnet
resource "aws_subnet" "lbistech_pri_sn" {
    vpc_id = aws_vpc.lbistech_vpc.id
    cidr_block = var.lbistech_pri_sub_cidr_block
    availability_zone = var.availability_zone_02

    tags = {
        "Name" = "${var.name}-pub-sn-01"
        "Environment" = "${var.env}"
    }
}

# 7 - Create Security Groups to allow port 22, 443, 80 traffic
resource "aws_security_group" "lbistech_web_sg" {
    name = "${var.name}-web-sg"
    description = var.description
    vpc_id = aws_vpc.lbistech_vpc.id

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["72.255.51.39/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "${var.name}-web-sg"
        "Environment" = "${var.env}"
    }
}

# 8 - Create a network interface
resource "aws_network_interface" "lbistech_web_server_nic" {
    subnet_id = aws_subnet.lbistech_pub_sn.id
    private_ip = var.static_pri_ip
    security_groups = [aws_security_group.lbistech_web_sg.id]  
}

# 9 - Assign an EIP to the network interface
resource "aws_eip" "lbistech_eip" {
    vpc = true
    network_interface = aws_network_interface.lbistech_web_server_nic.id
    associate_with_private_ip = var.static_pri_ip
    depends_on = [aws_internet_gateway.lbistech-igw]
}