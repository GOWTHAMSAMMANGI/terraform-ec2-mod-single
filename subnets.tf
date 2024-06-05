resource "aws_subnet" "subnet1-public" {
  vpc_id            = aws_vpc.testVpc01.id
  cidr_block        = var.cidr_block_subnet1
  availability_zone = "us-east-1a"

  tags = {
    Name  = "${var.vpc_name}-subnet1"
    Owner = "Gowtham Sammangi"
  }
}

resource "aws_subnet" "subnet2-public" {
  vpc_id            = aws_vpc.testVpc01.id
  cidr_block        = var.cidr_block_subnet2
  availability_zone = "us-east-1b"

  tags = {
    Name  = "${var.vpc_name}-subnet2"
    Owner = "Gowtham Sammangi"
  }
}