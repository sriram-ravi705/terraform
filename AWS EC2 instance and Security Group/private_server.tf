resource "aws_instance" "private_host" {
  ami             = data.aws_ami.ami_ec2.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.private_host_sg.id]
  subnet_id       = aws_subnet.private_subnet.id
  # associate_public_ip_address = "true"
  user_data = file("${path.module}/app-script.sh")
  key_name  = "terrakey"
  tags = {
    Name = "private_host"
  }
}