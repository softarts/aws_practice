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

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-example"
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  publicly_accessible = true
  db_name             = var.db_name
  #privileges = ["SELECT","UPDATE"]

  username = var.db_username
  password = var.db_password
}

# docker run -it --rm sami/mysql-client sh 
# mysql -h terraform-example20220409144227146400000001.cwvmiowiftn2.ap-southeast-1.rds.amazonaws.com -p 3306 -uadmin