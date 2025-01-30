resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "private security group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "private_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_igress" {
  security_group_id            = aws_security_group.private_sg.id
  ip_protocol                  = "tcp"
  from_port                    = 0
  to_port                      = 65535
  referenced_security_group_id = aws_security_group.baston_sg.id
  description                  = "ssh rule"
}