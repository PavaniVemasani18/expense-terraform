module "frontend" {
  source = "./modules/app"
  instanceType = var.instance_type
  sshUser = var.ssh_user
  sshPass = var.ssh_password
}