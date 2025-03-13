# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }
}

# VPC Peering Connection
resource "aws_vpc_peering_connection" "vpc_peering" {
  count        = var.enable_vpc_peering ? 1 : 0
  vpc_id       = aws_vpc.vpc.id
  peer_vpc_id  = var.accepter_vpc_id
  auto_accept  = false
  tags = {
    Name        = "${var.vpc_name}-peering-terraform"
    Environment = var.environment
  }
}

# Accept the VPC Peering Connection
resource "aws_vpc_peering_connection_accepter" "accepter" {
  count                     = var.enable_vpc_peering ? 1 : 0
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
  auto_accept               = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

# Public Route Table with VPC Peering Route
resource "aws_route" "public_peering_route" {
  count                 = var.enable_vpc_peering ? 1 : 0
  route_table_id        = aws_route_table.public.id
  destination_cidr_block = var.accepter_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

# Private Route Tables with VPC Peering Route
resource "aws_route" "private_peering_routes" {
  count                 = var.enable_vpc_peering ? length(var.azs) : 0
  route_table_id        = aws_route_table.private[count.index].id
  destination_cidr_block = var.accepter_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

# Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = var.azs[count.index]
  tags = {
    Name = "${var.vpc_name}-public-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
    Environment = var.environment
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, count.index + length(var.azs))
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
    Environment = var.environment
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = var.environment
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# NAT Gateway in a public subnet
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name        = "${var.vpc_name}-nat-eip"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id # NAT Gateway in the first public subnet
  tags = {
    Name        = "${var.vpc_name}-nat-gateway"
    Environment = var.environment
  }
}

# Private Route Tables
resource "aws_route_table" "private" {
  count  = length(var.azs)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.vpc_name}-private-rt-${count.index}"
    Environment = var.environment
  }
}

resource "aws_route" "private_route" {
  count                 = length(var.azs)
  route_table_id        = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id        = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.azs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}