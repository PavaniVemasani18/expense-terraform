resource "aws_instance" "test" {
  ami = "ami-05f020f5935e52dc4"
  instance_type = "t3.small"


  provisioner "remote-exec" {
    inline = [
       "sudo dnf install nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
  }
}
//data "aws_instances" "sec_group" {
//  name = "allow-all"
//}
