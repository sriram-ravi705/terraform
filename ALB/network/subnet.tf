// us-east-1a
resource "aws_subnet" "a1_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    availability_zone = var.a1_subnet_az
    cidr_block = var.a1_subnet_cidr_block
    tags = {
        Name = "1a_subnet"
    }
}
// us-east-1b
resource "aws_subnet" "b1_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    availability_zone = var.a2_subnet_az
    cidr_block = var.a2_subnet_cidr_block
    tags = {
        Name = "1b_subnet"
    }
}