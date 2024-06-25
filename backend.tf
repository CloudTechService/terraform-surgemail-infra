terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-cloud-tech"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "surgemail-terraform-backend"
  }
}