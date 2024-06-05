resource "aws_security_group" "fs-app" {
  name        = "fsapp-SG"
  description = "Allow fs-app inbound traffic"
  vpc_id      = aws_vpc.testVpc01.id

  ingress = [
    for port in [22, 80, 443, 8080, 9090, 5601,3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
