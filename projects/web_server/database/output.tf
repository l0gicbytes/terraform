output "Secret" {
  value = "${data.aws_secretsmanager_secret_version.server_pw.secret_string}"
}