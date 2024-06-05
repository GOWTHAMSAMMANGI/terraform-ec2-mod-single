module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "Ubuntu-instance"
  ami                    = var.imagename
  root_block_device = [
    {
      volume_size           = 30
      delete_on_termination = true
    }
  ]
  instance_type          = "t2.large"
  key_name               = "kops_keypair"
  monitoring             = true
  vpc_security_group_ids = ["${aws_security_group.fs-app.id}"]
  subnet_id              = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  user_data              = templatefile("./installs.sh", {})
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}