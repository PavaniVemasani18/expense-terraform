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
      "sudo pip3.11 install ansible -y",
      "ansible-pull -i localhost, -u https://github.com/PavaniVemasani18/learn-ansible expense.yml -e ${var.envr} -e rolename=${var.component} "
    ]
  }
}

//resource "aws_route53_record" "dnsrecord" {
//  name = "${var.component} - ${var.envr}"
//  type = "A"
//  zone_id = var.route_zoneid
//  ttl = var.dnsrecordttl
//  records = [aws_instance.instance.private_ip]
//}

data "aws_security_group" "selected"{
  name = var.securityname
}