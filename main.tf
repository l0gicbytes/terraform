provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami = "ami-40142d25"
  instance_type = "t2.micro"

  tags {
    Name = "terraform-example"
  }
}

