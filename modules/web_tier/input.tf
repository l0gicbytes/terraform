//use the remote state of the DB terraform to pull information
data "terraform_remote_state" "db" {
  backend = "s3"

  config {
    bucket = "${var.db_remote_state_bucket}"
    key    = "${var.db_remote_state_key}"
    region = "${var.db_remote_state_region}"
  }
}
