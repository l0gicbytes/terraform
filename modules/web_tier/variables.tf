variable "server_port" {
  description = "Port to be used for busybox to listen on"
  type        = "string"
  default     = "8080"
}

variable "ami_id" {
  description = "aws ami to be used to deploy web server ec2 instance"
  type        = "string"
  default     = "ami-759bc50a"                                         //us-east-1 ubuntu

  //  default = "ami-6a003c0f" //us-east-2 ubuntu
}

variable "autoscale_min" {
  description = "minimum number of instances in the autoscale group"
  type        = "string"
  default     = "2"
}

variable "autoscale_max" {
  description = "maximum number of instances in the autoscale group"
  type        = "string"
  default     = "5"
}

variable "instance_type" {
  description = "specify the instance type"
  default     = "t2-micro"
}

variable "cluster_name" {
  description = "The name to use for all cluster resources"
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state file"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state file in S3"
}

variable "db_remote_state_region" {
  description = "region of remote state bucket"
  default     = "us-east-1"
}

/*variable "dynamo_db_table" {
  description = "Dynamo table for state locking"
  default     = "tfstate"
}

variable "s3_backend_bucket" {
  description = "s3 backend for storing terraform state"
  default     = "mike-terraform-state.pom.com"
}

variable "s3_backend_key" {
  description = "path to terraform.state /application/web-service/terraform.tfstate"
}

variable "s3_backend_region" {
  description = "region for backend"
  default     = "us-east-1"
}*/

