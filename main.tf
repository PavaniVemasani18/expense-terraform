module "demo" {
  source = "./app"
  envr = var.env
  ami = var.ami
  instanceType=var.instance_type
  tagsname=var.name

}