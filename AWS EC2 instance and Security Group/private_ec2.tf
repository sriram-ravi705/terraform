resource "aws_instance" "private_host" {
  ami             = data.aws_ami.ami_ec2.id
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.private_sg.id]
  subnet_id       = module.vpc.public_subnets[1]
  user_data = file("${path.module}/app-script.sh")
  associate_public_ip_address = "true"
  tags = {
    Name = "Private_host"
  }
}