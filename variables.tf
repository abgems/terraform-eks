variable "aws_region"{
    default = "ap-south-1"
    description = "aws Region"
}

variable "vpc_cidr"{
    default = "10.0.0.0/16"
    description = "cidr block for the vpc"
}

variable "private_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
  
}

variable "public_subnets" {
    default = ["10.0.5.0/24", "10.0.4.0/24"]
    description = "public subnet cidr range"
}

variable "kuberentes_version" {
    default = "1.27"
}
