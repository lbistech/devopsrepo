# 1. Create VPC
resource "aws_vpc" "lbistech_vpc" {
    cidr_block = var.lbistech_vpc_cidr_block
    tags = {
        Name = "${var.name}-vpc"
        Environment = var.environment_name
    }
}

# 2. Create a Pub Subnet
resource "aws_subnet" "lbistech_pub_sn" {
    vpc_id            = aws_vpc.lbistech_vpc.id
    cidr_block        = var.lbistech_pub_sub_cidr_block
    availability_zone = var.availability_zone_01

    tags = {
        Name = "${var.name}-pub_subnet"
        Environment = var.environment_name
    }
}

# 2. Create a Private Subnet
resource "aws_subnet" "lbistech_pri_sn" {
    vpc_id            = aws_vpc.lbistech_vpc.id
    cidr_block        = var.lbistech_pri_sub_cidr_block
    availability_zone = var.availability_zone_02

    tags = {
        Name = "${var.name}-pri_subnet"
        Environment = var.environment_name
    }
}

# 3. Create Pub Route table
resource "aws_route_table" "lbistech_pub_route_table" {
    vpc_id = aws_vpc.lbistech_vpc.id

    route {
        cidr_block = var.wildcard_cidr
        gateway_id = aws_internet_gateway.lbistech_igw.id
    }

    tags = {
        Name = "${var.name}-pub_route_table"
        Environment = var.environment_name
    }
}

# 3. Create Pri Route table
resource "aws_route_table" "lbistech_pri_route_table" {
    vpc_id = aws_vpc.lbistech_vpc.id

    tags = {
        Name = "${var.name}-pri_route_table"
        Environment = var.environment_name
    }
}

# 4. Associate public subnet with the route tables
resource "aws_route_table_association" "subnet_association" {
    subnet_id      = aws_subnet.lbistech_pub_sn.id
    route_table_id = aws_route_table.lbistech_pub_route_table.id
}

# 5. Associate private subnet with the route tables
resource "aws_route_table_association" "pri_subnet_association" {
    subnet_id      = aws_subnet.lbistech_pri_sn.id
    route_table_id     = aws_route_table.lbistech_pri_route_table.id
}

# 6. Create Internet Gateway
resource "aws_internet_gateway" "lbistech_igw" {
    vpc_id = aws_vpc.lbistech_vpc.id
    tags = {
        Name = "${var.name}-igw"
        Environment = var.environment_name
    }
}

# 7. Create Security Groups to allow port 22, 80, 443
resource "aws_security_group" "lbistech_web_sg" {
    name        = "${var.name}-web-sg"
    description = var.description
    vpc_id      = aws_vpc.lbistech_vpc.id

    ingress {
        description = "HTTPS"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.name}-web_sg"
        Environment = var.environment_name
    }
}