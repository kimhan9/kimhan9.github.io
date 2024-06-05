#S3 where the terraform state will be stored

terraform {
  required_version = ">= 0.15.1"
  backend "s3" {
    region = "us-east-1"
    bucket = "training-760886765969-terraform-state"
    key    = "760886765969-training-assignment/terraform.tfstate"
  }
}