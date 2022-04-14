variable "rds_users" {
    description = "list of username(database)"
    default = [
        "terraform-gateway-service",
        "terraform-cache-service",
        "batch-robot"
    ]
}

variable "environment" {
    description = "environment"
    type = string
    default = "dev-sg"
}

variable "app_name" {
    description = "app name"
    type = string
    default = "apps"
}
