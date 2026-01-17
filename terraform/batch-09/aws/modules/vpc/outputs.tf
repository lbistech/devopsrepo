output "vpc_id" {
    value = aws_vpc.lbistech_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.lbistech_pub_sn.id
}