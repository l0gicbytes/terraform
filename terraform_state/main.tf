provider "aws" {
  region = "us-east-1"
}

// when updating backend make sure to initialize, terraform init
terraform {
  backend "s3" {
    bucket = "mike-terraform-state.pom.com"
    key = "bucket_test/terraform.tfstate"
    region = "us-east-1"
// Dynamo DB must be created before enabling locking, primary key must be LockID
    dynamodb_table = "tfstate"
// Encryption set at the bucket level    
#    encrypt = true
  }
}



resource "aws_s3_bucket" "terraform_state" {
    bucket = "mike-terraform-state.pom.com"
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_dynamodb_table" "dyn_tf_state" {
  name = "tfstate"
  read_capacity = 5
  write_capacity = 5
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

/*output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.bucket_domain_name}"
}

output "s3_bucket_region" {
  value = "${aws_s3_bucket.terraform_state.region}"
}*/