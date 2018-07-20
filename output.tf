output "elb_dns_name" {
  value = "http://${aws_elb.example.dns_name}"
}