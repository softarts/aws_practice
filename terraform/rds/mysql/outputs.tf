output "address" {
  value       = aws_db_instance.default.address
  description = "The database address"
}


output "password" {
  value       = aws_db_instance.default.password
  description = "The database password"
}
