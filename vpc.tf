provider "aws" {
    region = var.aws_region
  
}
data "aws_availability_zones" "available" {}

locals {
 cluster_name = "ab-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
    length = 8
    special = false
  
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.7.0"

    name = "my-eks-vpc"
    cidr = var.vpc_cidr
    azs = data.aws_availability_zones.available.names
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true
    
  
}
