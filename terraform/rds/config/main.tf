locals {
    rds_userpassword_map = {
        for el in var.rds_users: format("%s",el) => random_password.rds_userpassword[el].result
    }
    create_user_cmd_list = [
        for el in var.rds_users: 
            format("CREATE USER '%s' IDENTIFIED BY '%s';",el,random_password.rds_userpassword[el].result)
    ]
}

resource "random_password" "rds_userpassword" {
    for_each = toset(var.rds_users)
    length  = 16
    special = false
    min_upper = 3
    min_numeric = 3
}

resource "aws_secretsmanager_secret" "rds_users_credentials" {
  name = format("rds-user-credentials-%s-%s",var.app_name, var.environment)
  description = "rds user credentials"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "rds_users_credentials" {
  secret_id     = aws_secretsmanager_secret.rds_users_credentials.id
  secret_string = jsonencode(local.rds_userpassword_map)
}


# resource "null_resource" "setup_db" {  
#   depends_on = [aws_secretsmanager_secret_version.rds_users_credentials]
#   triggers = {
#     rds_users = sha256(jsonencode(var.rds_users))
#   }
#   provisioner "local-exec" {
#     interpreter = ["/bin/bash", "-c"]    
#     command = "aws secretsmanager get-secret-value --secret-id rds-user-credentials-apps-dev-sg  --region ap-southeast-1"
#   }
# }

