output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_public_subnet" {
  value = module.vpc.public_subnets[0]
}

output "vpc_private_subnet" {
  value = module.vpc.private_subnets[0]
}