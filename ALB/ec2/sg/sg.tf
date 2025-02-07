resource "aws_security_group" "sg_ec2" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "sg_vpc"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.sg_ec2.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
    security_group_id = aws_security_group.sg_ec2.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "httpd" {
    security_group_id = aws_security_group.sg_ec2.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 443 
    to_port = 443
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  cidr_ipv4 = "0.0.0.0/0"
  security_group_id = aws_security_group.sg_ec2.id
  ip_protocol = -1
}