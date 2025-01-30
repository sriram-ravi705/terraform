output "baston_ec2" {
  value = aws_instance.baston_host.public_ip
}

output "private_ec2" {
  value = aws_instance.private_host.private_ip
}