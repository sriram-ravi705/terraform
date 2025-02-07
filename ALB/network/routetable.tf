resource "aws_route_table" "public_subnet_route_table" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        gateway_id = aws_internet_gateway.vpc_internet.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
      Name = "public_subnet_route_table"
    }
}

resource "aws_route_table_association" "a1_subnet" {
  route_table_id = aws_route_table.public_subnet_route_table.id
  subnet_id = aws_subnet.a1_subnet.id
}

resource "aws_route_table_association" "a2_subnet" {
  route_table_id = aws_route_table.public_subnet_route_table.id
  subnet_id = aws_subnet.a2_subnet.id
}