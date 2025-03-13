data "aws_secretsmanager_secret_version" "amazonmq_credentials" {
  secret_id = var.secret_id
}

resource "aws_mq_broker" "broker" {
  broker_name        = var.broker_name
  engine_type        = "RabbitMQ"
  engine_version     = "3.11.28"
  host_instance_type = var.rabbitmq_instance_type
  publicly_accessible = false
  security_groups    = [aws_security_group.amazonmq_sg.id]
  subnet_ids         = var.subnet_ids

  user {
    username = jsondecode(data.aws_secretsmanager_secret_version.amazonmq_credentials.secret_string).username
    password = jsondecode(data.aws_secretsmanager_secret_version.amazonmq_credentials.secret_string).password
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_security_group" "amazonmq_sg" {
  name        = "amazonmq-sg"
  description = "Security group for AmazonMQ"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inbound traffic for AmazonMQ console and broker"
    from_port   = 5671
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound traffic for AmazonMQ management console"
    from_port   = 8162
    to_port     = 8162
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
    Name        = "amazonmq-sg"
    Environment = var.environment
  }
}