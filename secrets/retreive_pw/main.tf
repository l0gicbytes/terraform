provider "aws" {
  region = "us-east-1"
}

data "aws_secretsmanager_secret" "server_pw" {
  name = "dbPass1"
}

data "aws_secretsmanager_secret_version" "server_pw" {
  secret_id = "${data.aws_secretsmanager_secret.server_pw.id}"
}

output "Secret" {
  value = "${data.aws_secretsmanager_secret_version.server_pw.secret_string}"
}
