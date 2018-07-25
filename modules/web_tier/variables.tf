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

variable "cluster_name" {
  description = "The name to use for all cluster resources"
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state file"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state file in S3"
}
