bucket = var.bucket
key =  var.key
region = var.region

variable "bucket"{}
variable "key"{}
variable "region"{}


output "bucket"{
  value=var.bucket
}
output "key"{
  value=var.key
}
output "region"{
  value=var.region
}