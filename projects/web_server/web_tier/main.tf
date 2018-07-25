provider "aws" {
  region = "us-east-1"
}

module "web_tier" {
  source = "../../../modules/web_tier"
}