//  resource "aws_instance" "test" {
//    ami = "ami-05f020f5935e52dc4"
//    instance_type = "t3.small"
//    vpc_security_group_ids = [data.aws_security_group.sec_group.id]
//    tags = {
//      Name = "demo"
//    }
//
//    provisioner "remote-exec" {
//      connection {
//        type     = "ssh"
//        user     = "ec2-user"
//        password = "DevOps321"
//        host     = self.public_ip
//     }
//      inline = [
//        "sudo dnf install nginx -y",
//        "sudo systemctl start nginx"
//      ]
//    }
//  }
  resource "aws_instance" "test1" {
    ami = "ami-05f020f5935e52dc4"
    instance_type = "t3.small"
    vpc_security_group_ids = [
      data.aws_security_group.sec_group.id]
    tags = {
      Name = "demo1"
    }
  }
  resource "null_resource" "test1"{
    provisioner "remote-exec" {
      connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = aws_instance.test1.public_ip
      }
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
    }
  }
   data "aws_security_group" "sec_group" {
    name = "allow-all"
  }
