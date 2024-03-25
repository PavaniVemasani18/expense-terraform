resource "null_resource" "test" {
  ami=var.message
}

variable "message"{}

output "message" {
  value = var.message
}