resource "aws_instance" "baston_host" {
  ami                         = data.aws_ami.ami_ec2.id
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  security_groups             = [aws_security_group.baston_sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = "true"
  tags = {
    Name = "Baston_host"
  }
}