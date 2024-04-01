resource "aws_instance" "page" {
  ami = "ami-05f020f5935e52dc4"
  instance_type = "t3.small"
  vpc_security_group_ids = [
    data.aws_security_group.security.id]
  tags = {
    Name = "page"
  }
}
resource "null_resource" "test" {
provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.page.public_ip
  }
  inline = [
    "sudo dnf install nginx -y",
    "sudo systemctl start nginx"
  ]
}

}

  data "aws_security_group" "security" {
  name = "allow-all"
}