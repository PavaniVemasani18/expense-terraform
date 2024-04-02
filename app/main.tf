resource "aws_instance" "demo" {
  ami = var.ami
  instance_type = var.instanceType
  tags = {
    Name = var.tagsname
  }
  vpc_security_group_ids = [data.aws_security_group.selected.id]
}

data "aws_security_group" "selected"{
  name = "allow-all"
}