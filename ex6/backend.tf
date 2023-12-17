terraform {
  backend "s3" {
    bucket = "terraform-tony-tf"
    key    = "test-project/backend_ex6"
    region = "eu-central-1"
  }
}