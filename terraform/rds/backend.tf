terraform {
    backend "s3" {
        bucket         = "zr-terraform-s3-state"
        key            = "mysql-apps-dev-sg/terraform.tfstate"
        region         = "ap-southeast-1"
    }
}