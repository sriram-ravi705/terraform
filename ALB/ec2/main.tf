resource "aws_instance" "a1_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.security_groups]
  subnet_id = var.a1_subnet_id
  associate_public_ip_address = "True"
  tags = {
    Name = "a1_instance"
  }
}

resource "aws_instance" "b1_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.security_groups]
  subnet_id = var.a2_subnet_id
  associate_public_ip_address = "True"
  tags = {
    Name = "b1_instance"
  }
}