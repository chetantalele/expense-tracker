terraform {
  backend "s3" {
    bucket         = "devops-zero-touch-terraform-state"
    key            = "eks/zero-touch/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
