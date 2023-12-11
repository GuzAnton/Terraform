resource "aws_instance" "ex2" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  availability_zone      = var.zone1
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-0113d33bc239ddefc"]
  tags = {
    Name = "ex2"
  }
}