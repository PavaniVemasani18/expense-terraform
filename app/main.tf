resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instanceType
  tags = {
    Name = var.component
  }
  vpc_security_group_ids = [data.aws_security_group.selected.id]
}

resource "null_resource" "expense" {
  provisioner "remote-exec" {
    connection {
      type     = var.type
      user     = var.user
      password = var.password
      host     = aws_instance.instance.public_ip
    }
    inline = [
        "sudo pip3.11 install ansible",
        "ansible-pull -i localhost, https://github.com/PavaniVemasani18/learn-ansible expense.yml env=${var.envr} rolename=${var.component}"

//      "sudo dnf install nginx -y",
//      "sudo systemctl start nginx"
    ]
  }
}


data "aws_security_group" "selected"{
  name = var.securityname
}