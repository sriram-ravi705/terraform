resource "aws_instance" "baston_host" {
  ami                         = data.aws_ami.ami_ec2.id
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.baston_host_sg.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = "true"
  key_name                    = "terrakey"
  tags = {
    Name = "baston_host"
  }
}