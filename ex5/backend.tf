terraform {
  backend "s3" {
    bucket = "terraform-tony-tf"
    key    = "test-project/backend"
    region = "eu-central-1"
  }
}