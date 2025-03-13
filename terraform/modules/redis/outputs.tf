output "redisendpoint" {
  description = "The endpoint address of the Redis cluster"
  value       = aws_elasticache_cluster.redis.configuration_endpoint
}

output "redis_port" {
  description = "The port number of the Redis cluster"
  value       = aws_elasticache_cluster.redis.port
}

output "redis_subnet_group" {
  description = "The subnet group name of the Redis cluster"
  value       = aws_elasticache_subnet_group.redis.name
}

output "redis_security_group_ids" {
  description = "The security group IDs associated with the Redis cluster"
  value       = aws_elasticache_cluster.redis.security_group_ids
}
