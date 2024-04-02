module "frontend" {
  source = "./modules/app"
  envr = var.env
  ami = var.ami
  component="frontend"
  instanceType=var.instance_type
  type = var.type
  user = var.user
  password = var.password
  dnsrecordType = var.dnsType
  hostZone = var.hostZoneId
}
module "backend" {
  source = "./modules/app"
  envr = var.env
  ami = var.ami
  component="backend"
  instanceType=var.instance_type
  type = var.type
  user = var.user
  password = var.password
  dnsrecordType = var.dnsType
  hostZone = var.hostZoneId
}
module "mysql" {
  source = "./modules/app"
  envr = var.env
  ami = var.ami
  component="backend"
  instanceType=var.instance_type
  type = var.type
  user = var.user
  password = var.password
  dnsrecordType = var.dnsType
  hostZone = var.hostZoneId
}


