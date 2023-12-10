provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "Start" {
  ami                    = "ami-06dd92ecc74fdfb36"
  instance_type          = "t2.micro"
  key_name               = "frankfurt"
  vpc_security_group_ids = ["sg-0113d33bc239ddefc"]
  availability_zone      = "eu-central-1a"
  tags = {
    Name = "Start"
  }
}