variable "server_port" {
  description = "Port to be used for busybox to listen on"
  type    = "string"
  default = "8080"
}

output "public_ip" {
  value = "http://${aws_instance.example.public_ip}:${var.server_port}"
}