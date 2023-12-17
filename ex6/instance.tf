resource "aws_key_pair" "test6" {
  key_name   = "test_ex6"
  public_key = file("test.pub")
}

resource "aws_instance" "ex6" {
  ami                    = var.AMIS
  key_name               = aws_key_pair.test6.key_name
  availability_zone      = var.AvailabilityZoneCentrala
  instance_type          = var.InstanceType
  vpc_security_group_ids = [aws_security_group.Test-SG.id]
  subnet_id              = aws_subnet.TestSubnet-PUB-1.id
  tags = {
    Name = "Ex6"
  }
}

resource "aws_ebs_volume" "ex6_volume" {
  availability_zone = var.AvailabilityZoneCentrala
  size              = 3
  tags = {
    Name = "Ex6_volume"
  }
}
resource "aws_volume_attachment" "ex6_attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ex6_volume.id
  instance_id = aws_instance.ex6.id
}

output "PublicIp" {
  value = aws_instance.ex6.public_ip
}