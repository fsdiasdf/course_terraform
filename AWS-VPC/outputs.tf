output "subnet_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "ID da Security Group criada pela AWS"
  value       = aws_security_group.security_group.id
}