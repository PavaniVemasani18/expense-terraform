module "demo" {
  source = "./app"
  envr = var.env
  ami = var.ami
  instanceType=var.instance_type
  tagsname=var.name
  type = var.type
  user = var.user
  password = var.password
  securityname=var.security_name

}