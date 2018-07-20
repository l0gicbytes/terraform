provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"
  password = "${data.aws_secretsmanager_secret_version.server_pw.secret_string}"
  skip_final_snapshot = true
}