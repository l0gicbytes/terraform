provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "dbpass1" {
  name = "dbPass1"
  description = "Confidential Secret"
}


resource "aws_secretsmanager_secret_version" "dbpass1" {
  secret_id     = "${aws_secretsmanager_secret.dbpass1.id}"
  secret_string = "db-Password"
}

/*output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.bucket_domain_name}"
}

output "s3_bucket_region" {
  value = "${aws_s3_bucket.terraform_state.region}"
}*/