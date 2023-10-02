provider "aws" {
  # Configuration options
  region = var.region
  alias  = "us_east_1"
}

terraform {
  backend "s3" {
    bucket = "s3-bucket-for-ec3-tf"
    key    = "terraform-ecr.tfstate"
    region = "ap-south-1"
  }
}