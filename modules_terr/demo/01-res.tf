resource "null_resource" "test" {

}

variable "message"{}
variable "env"{}
output "message" {
  value = var.message
}
output "env" {
  value = var.env
}