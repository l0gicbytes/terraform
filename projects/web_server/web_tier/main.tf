provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mike-terraform-state.pom.com"
    key    = "projects/web_server/web_tier/terraform.tfstate"
    region = "us-east-1"

    // Dynamo DB must be created before enabling locking, primary key must be LockID
    dynamodb_table = "tfstate"

    // Encryption set at the bucket level
    #    encrypt = true
  }
}

module "web_tier" {
  source = "../../../modules/web_tier"

  cluster_name = "webservers-stage"

  db_remote_state_bucket = "mike-terraform-state.pom.com"

  db_remote_state_key = "projects/web_server/database/terraform.tfstate"

  instance_type = "t2.nano"
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size              = 2
  max_size              = 5
  desired_capacity      = 3
  recurrence            = "0 9 * * *"

  autoscaling_group_name = "${module.web_tier.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size              = 2
  max_size              = 5
  desired_capacity      = 4
  recurrence            = "0 17 * * *"

  autoscaling_group_name = "${module.web_tier.asg_name}"
}
