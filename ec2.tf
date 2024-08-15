module "ec2_instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

  name = var.instance_name
  ami  = var.ami

  instance_type = var.instance_type
  key_name      = var.key_name

  monitoring             = false
  vpc_security_group_ids = ["sg-01d6643d343e44efe"]
  subnet_id              = var.subnet_id
  # user_data                   = <<-EOT
  #     #!/bin/bash

  #     NEW_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClmqvyGFQmZkf+EstmoX6XJeCDkNbDxscfip1L/IKhz8x5Qf3j0b0Jz2TfZI3/nV7FoW0AMbQQceJMG22oQsf1vQoAHiiCnIFFCjWgtTztqJyzczuwvSWYTG/iuBtEQaZg/R4gYIF9IjHl+INa/LbGQIVsxLyJ303X0HmXoob3pEhQ9VZmbc73w3eEjzmIkByjb0GpF7H+/qtO06mXxkfwclJkQj20oPVis57oLfjRIwZT3KkZhJCNo/tejmS4U4Gs720KRqwg68qJwAiBsrXuE1GC72zxLUDdsxqN7+kUbhsTgx9JCdBkYgm4DzeBJLpKlKBPYyXev7hyhy6AuNBkbp7fkEPSoBlx/qPfNGRZeQZc6Ekn6xNB/2ukHlvwXQaWFTLMSRN7JQtBuH7xAJzEuEV5CKu2FwVCJMS2UvutxAlSiz61cjUXGG8qBvyhowKr6MPwwhrmeNTqlVHZCT1b5vGb2D+jxtArFiDmepQDv3RlWvNXuYU0/4us6a6FXYlrI2GzeQbaQiWzTf/rxUUz0DyMud3KkOaLO33LHcBJOXKEnaQ/Ld7AHdC3vQTbXCJg0OPo1IUmYsMFh3YFp/dww91r55FKSXnScpGx0GSV9LpInEOaehFVknfiE3qwHKHyxvYEb4RLXixVfcCCe6cYLHWUVrw2ibqleniOv5+hlQ== sakshi.ch496@gmail.com"
  #     USER="ubuntu"  
  #     AUTH_KEYS_FILE="/home/$USER/.ssh/authorized_keys"

  #     # Ensure the .ssh directory exists
  #     if [ ! -d "/home/$USER/.ssh" ]; then
  #         sudo mkdir -p /home/$USER/.ssh
  #         sudo chown $USER:$USER /home/$USER/.ssh
  #         sudo chmod 700 /home/$USER/.ssh
  #     fi

  #     # Add the new key to the authorized_keys file
  #     echo $NEW_KEY | sudo tee -a $AUTH_KEYS_FILE

  #     # Set the correct permissions
  #     sudo chown $USER:$USER $AUTH_KEYS_FILE
  #     sudo chmod 600 $AUTH_KEYS_FILE
  #   EOT


  root_block_device = [{
    volume_size           = 300   # Size of the root volume in GB
    volume_type           = "gp3" # Type of the root volume (e.g., gp2, io1)
    delete_on_termination = true  # Whether the volume should be deleted when the instance is terminated
  }]

  tags = {
    Terraform   = var.Terraform
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_eip" "lb" {
  instance = module.ec2_instance.id
  tags = {
    Name = "surgemail"
  }
}