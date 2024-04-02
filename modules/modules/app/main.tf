resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo message ${var.message_m}"
  }
  provisioner "local-exec" {
    command = "echo message ${var.print_p}"
  }

}

//step5