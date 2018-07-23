output "Secret" {
  value = "${data.aws_secretsmanager_secret_version.server_pw.secret_string}"
}

output "address" {
  value = "${aws_db_instance.example.address}"
}

output "port" {
  value = "${aws_db_instance.example.port}"
}

output "endpoint" {
  value = "${aws_db_instance.example.endpoint}"
}