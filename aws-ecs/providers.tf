provider "aws" {
    region = "us-east-1"
  
}


terraform {
  backend "s3" {
    bucket = "s3-bucket-for-ec3-tf"
    key    = "terraform-ecr.tfstate"
    region = "ap-south-1"
  }
}


