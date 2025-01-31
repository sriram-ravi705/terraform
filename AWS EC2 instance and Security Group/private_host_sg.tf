resource "aws_security_group" "private_host_sg" {
  name   = "private_subnet_sg"
  vpc_id = aws_vpc.vpc_dev.id
  tags = {
    Name = "private_subnet_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_from_baston_host" {
  security_group_id            = aws_security_group.baston_host_sg.id
  ip_protocol                  = -1
  referenced_security_group_id = aws_security_group.baston_host_sg.id
}