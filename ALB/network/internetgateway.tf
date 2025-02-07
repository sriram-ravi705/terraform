resource "aws_internet_gateway" "vpc_internet" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "internet_gateway"
  }
}