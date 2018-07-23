provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mike-terraform-state.pom.com"
    key = "projects/web_server/database/terraform.tfstate"
    region = "us-east-1"
// Dynamo DB must be created before enabling locking, primary key must be LockID
    dynamodb_table = "tfstate"
// Encryption set at the bucket level
#    encrypt = true
  }
}

resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  #identifier = "example-database" // should be optional
  username = "admin"
  password = "${data.aws_secretsmanager_secret_version.server_pw.secret_string}"
  skip_final_snapshot = true
}