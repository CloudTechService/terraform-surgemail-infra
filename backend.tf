terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-cloud-tech-qa"
    key            = "state/terraform-state.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "surgemail-terraform-backend"
  }
}