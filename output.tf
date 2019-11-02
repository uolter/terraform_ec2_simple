## Useful output values

output "webapp_public_address" {
  value = aws_instance.web-ec2-instance.public_ip
}