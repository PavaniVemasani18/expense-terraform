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
//      "sudo  dnf pip3.11 install ansible",
//      "ansible-pull -i localhost, -u https://github.com/PavaniVemasani18/learn-ansible.git expense.yml -e ${var.envr} -e rolename=${var.component} "
     "sudo dnf install nginx",
      "sudo systemctl start service"
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