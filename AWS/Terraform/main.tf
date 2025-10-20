provider "aws" {
}
resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name: "development"
  }
}
variable "subnet_cidr_block" {
  description = "subnet cidr block"
  # default = "10.0.10.0/24"
  type = list(object({
    cidr_block = string
    name = string
  }))
   
}

variable "environment" {
  description = "deployment environment"
  
}
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block[1].cidr_block
    availability_zone = "eu-west-1a"  
     tags = {
        Name: var.subnet_cidr_block[1].name
  }
}

data "aws_vpc" "existing_vpc"{
    default = true
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = var.vpc_cidr_block
    availability_zone = "eu-west-1a"  
     tags = {
        Name: "default"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}


output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}