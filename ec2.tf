module "ec2_instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

  name = "mail-instance"
  ami  = "ami-09040d770ffe2224f"

  instance_type = "t2.micro"
  key_name      = "sakshi-mail"

  monitoring             = false
  vpc_security_group_ids = ["sg-033f4f527ebc6646b"]
  subnet_id              = "subnet-03785cda9938c768d"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "DevOps-sakshi"
  }
}