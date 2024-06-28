module "ec2_instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

  name = var.instance_name
  ami  = var.ami

  instance_type = var.instance_type
  key_name      = var.key_name

  monitoring             = false
  vpc_security_group_ids = ["sg-01d6643d343e44efe"]
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = var.Terraform
    Environment = var.Environment
    Owner       = var.Owner
  }
}


resource "aws_eip" "lb" {
  instance = module.ec2_instance.id

}