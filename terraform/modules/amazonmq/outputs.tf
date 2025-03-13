output "amazonmq_broker_name" {
  description = "The name of the AmazonMQ broker"
  value       = aws_mq_broker.broker.broker_name
}
output "amazonmq_security_group_ids" {
  description = "The security group IDs associated with the AmazonMQ broker"
  value       = aws_mq_broker.broker.security_groups
}

output "amazonmq_engine_version" {
  description = "The engine version of the AmazonMQ broker"
  value       = aws_mq_broker.broker.engine_version
}