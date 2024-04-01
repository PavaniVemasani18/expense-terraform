data "aws_ami" "aws" {
  most_recent = true
  name_regex = "RHEL-9-DevOps-Practice"
  owners = ["973714476881"]
}
data "aws_security_group" "security" {
  name = "allow-all"
}