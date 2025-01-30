resource "aws_security_group" "baston_sg" {
  name        = "baston_sg"
  description = "baston security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "baston_sg_public"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.baston_sg.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
  description       = "ssh rule"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.baston_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
  description       = "http rule"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.baston_sg.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
  description       = "https rule"
}