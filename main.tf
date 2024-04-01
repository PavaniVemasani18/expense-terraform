module "frontend" {
  source = "./modules/app"
  instance_type = var.instance_type
}