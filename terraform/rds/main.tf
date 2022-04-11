terraform {
  required_version = ">= 1.0.0"

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

resource "random_password" "master_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "default" {
  identifier_prefix   = "terraform-mysql-dev-apps"
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  publicly_accessible = true
  db_name             = "terraform_main_database"
  username = "admin"
  password = random_password.master_password.result
}


resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "credentials"
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.rds_credentials.id
  secret_string = <<EOF
{
  "username": "${aws_db_instance.default.username}",
  "password": "${random_password.master_password.result}",
  "engine": "mysql",
  "host": "${aws_db_instance.default.address}",
  "port": ${aws_db_instance.default.port},
  "dbClusterIdentifier": "${aws_db_instance.default.identifier_prefix}"
}
EOF
}