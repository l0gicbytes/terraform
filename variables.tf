variable "server_port" {
  description = "Port to be used for busybox to listen on"
  type    = "string"
  default = "8080"
}

output "elb_dns_name" {
  value = "http://${aws_elb.example.dns_name}"
}