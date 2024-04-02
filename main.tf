module "frontend" {
  source = "./app"
  envr = var.env
  ami = var.ami
  component="frontend"
  instanceType=var.instance_type
  type = var.type
  user = var.user
  password = var.password
  dnstype = var.dnstype
  hostZoneId = var.zoneid
}


