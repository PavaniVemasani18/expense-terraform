resource "null_resource" "test" {}

variable "message"{}

output "message" {
  value = var.message
}