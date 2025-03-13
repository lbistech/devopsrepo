resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_identifier
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_clusters
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = [aws_security_group.redis_sg.id]

  tags = {
    Environment = var.environment
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.configuration_endpoint
}

resource "aws_security_group" "redis_sg" {
  name        = "redis-sg"
  description = "Security group for Redis"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inbound traffic for Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "redis-sg"
    Environment = var.environment
  }
}