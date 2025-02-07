ami_id = "ami-085ad6ae776d8f09c"
instance_type = "t2.micro"
key_name = "terraform_key"
security_groups = aws_security_group.sg_ec2.id
a1_subnet_id = aws_subnet.a1_subnet.id
a2_subnet_id = aws_subnet.a2_subnet.id