terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-example"
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true

  db_name             = var.db_name

  username = var.db_username
  password = var.db_password
}