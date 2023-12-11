resource "aws_key_pair" "new_key" {
  key_name   = "test"
  public_key = file("test.pub")
}

resource "aws_instance" "ex3" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.new_key.key_name
  availability_zone      = var.zone1
  vpc_security_group_ids = ["sg-0321122bcf9584b47"]
  tags = {
    Name = "Ex3"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.user
    private_key = file("test")
    host        = self.public_ip
  }
}