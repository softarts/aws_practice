terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      # Allow any 2.x version of the AWS provider
      version = "~> 2.0"
    }
  }

  backend "s3" {
      bucket         = "zr-terraform-s3-state"
      key            = "dev/terraform.tfstate"
      region         = "ap-southeast-1"
      # dynamodb_table = "<YOUR DYNAMODB TABLE>"
      # encrypt        = true
  }

}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-02a45d709a415958a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # Render the User Data script as a template
  user_data = templatefile("user-data.sh", {
    server_port = var.server_port
    db_address  = "database address"
    db_port     = "database port"
  })

  tags = {
    Name = "terraform-example-app"
  }
}

resource "aws_security_group" "instance" {

  name = var.security_group_name

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}