resource "null_resource" "frontend" {
  ami = data.aws_ami.example
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.default.id]
}
