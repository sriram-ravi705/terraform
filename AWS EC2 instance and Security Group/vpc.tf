module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  enable_dns_support   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    Name = "public subnet"
  }

  private_subnet_tags = {
    Name = "private subnet"
  }

  vpc_tags = {
    Name = "Dev Environment"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}