provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mike-terraform-state.pom.com"
    key = "bucket_test/terraform.tfstate"
    region = "us-east-1"
#    encrypt = true
  }
}



resource "aws_s3_bucket" "terraform_state" {
    bucket = "mike-terraform-state.pom.com"
/*    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }*/
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
}