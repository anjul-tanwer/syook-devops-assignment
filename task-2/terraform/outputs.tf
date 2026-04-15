output "public_ip" {
  value       = aws_instance.app.public_ip
  description = "Public IP of EC2"
}
