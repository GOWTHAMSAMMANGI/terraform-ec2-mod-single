resource "aws_vpc" "testVpc01" {
  cidr_block           = var.cidr_block1
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Owner       = "Gowtham Sammangi"
    environment = var.env
  }
}

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.testVpc01.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}
