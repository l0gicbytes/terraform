data "terraform_remote_state" "db" {
  backend = "s3"
  config {
    bucket = "mike-terraform-state.pom.com"
    key = "projects/web_server/database/terraform.tfstate"
    region = "us-east-1"
  }
}