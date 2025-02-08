resource "aws_instance" "a1_ec2" {
  ami                         = "ami-085ad6ae776d8f09c"
  instance_type               = "t2.micro"
  key_name                    = "terraform_key"
  security_groups             = [aws_security_group.sg_aws.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = "true"
  user_data                   = file("${path.module}/userdata.sh")
  tags = {
    Name = "a1_ec2"
  }
}

resource "aws_instance" "b1_ec2" {
  ami                         = "ami-085ad6ae776d8f09c"
  instance_type               = "t2.micro"
  key_name                    = "terraform_key"
  security_groups             = [aws_security_group.sg_aws.id]
  subnet_id                   = module.vpc.public_subnets[1]
  associate_public_ip_address = "true"
  user_data                   = file("${path.module}/userdata.sh")
  tags = {
    Name = "b1_ec2"
  }
}