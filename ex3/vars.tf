variable "region" {
  default = "eu-central-1"
}

variable "zone1" {
  default = "eu-central-1a"
}

variable "zone2" {
  default = "eu-west-1a"
}

variable "amis" {
  type = map(any)
  default = {
    eu-central-1 = "ami-0669b163befffbdfc"
    eu-west-1    = "ami-0694d931cee176e7d"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "frankfurt"
}

variable "user" {
  default = "ec2-user"
}