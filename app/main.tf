resource "aws_instance" "demo" {
  ami = var.ami
  instance_type = var.instanceType
  tags = {
    Name = var.tagsname
  }
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  provisioner "remote-exec" {
    connection {
      type     = var.type
      user     = var.user
      password = var.password
      host     = self.public_ip
    }
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
    ]
  }
}

data "aws_security_group" "selected"{
  name = var.securityname
}