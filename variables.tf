variable "Terraform" {
  type    = string
  default = "true"
}

variable "Environment" {
  type    = string
  default = "dev"
}

variable "Owner" {
  type    = string
  default = "sakhi-devops"
}



variable "instance_type" {
  type    = string
  default = "c5.2xlarge"
}

variable "key_name" {
  type    = string
  default = "sakshi-mail"
}

variable "ami" {
  type    = string
  default = "ami-09040d770ffe2224f"
}

variable "instance_name" {
  type    = string
  default = "mail-instance"
}

variable "subnet_id" {
  type    = string
  default = "subnet-4e6d4a26"
}


