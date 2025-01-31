resource "aws_vpc" "vpc_dev" {
  cidr_block = "192.182.0.0/16"
  tags = {
    Name = "vpc_dev"
  }
}

resource "aws_internet_gateway" "vpc_dev_internet" {
  vpc_id = aws_vpc.vpc_dev.id
  tags = {
    Name = "vpc_dev_internet"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc_dev.id
  availability_zone = "us-east-1a"
  cidr_block        = "192.182.1.0/24"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_dev.id
  availability_zone = "us-east-1b"
  cidr_block        = "192.182.2.0/24"
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_route_table" "public_subnet_route" {
  vpc_id = aws_vpc.vpc_dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_dev_internet.id
  }
  tags = {
    Name = "public subnet"
  }
}

resource "aws_route_table_association" "route_table_association_public_subnet" {
  route_table_id = aws_route_table.public_subnet_route.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "private_instance_nat_gateway" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.nat_gateway_eip.id
  tags = {
    Name = "private subnet nat gateway"
  }
}

resource "aws_route_table" "private_subnet_route" {
  vpc_id = aws_vpc.vpc_dev.id
  route {
    nat_gateway_id = aws_nat_gateway.private_instance_nat_gateway.id
    cidr_block     = "0.0.0.0/0"
  }
  tags = {
    Name = "private subnet"
  }
}

resource "aws_route_table_association" "route_table_association_private_subnet" {
  route_table_id = aws_route_table.private_subnet_route.id
  subnet_id      = aws_subnet.private_subnet.id
}
