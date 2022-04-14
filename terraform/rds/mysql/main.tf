resource "random_password" "master_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "default" {
  identifier_prefix   = format("mysql-%s-%s",var.app_name,var.environment)
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  publicly_accessible = true
  db_name             = "main_database"
  username = "admin"
  password = random_password.master_password.result
}


resource "aws_secretsmanager_secret" "mysql_credentials" {
  name = format("mysql-credentials-%s-%s",var.app_name,var.environment)
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "mysql_credentials" {
  secret_id     = aws_secretsmanager_secret.mysql_credentials.id
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



# resource "null_resource" "setup_db" {
#   depends_on = ["aws_db_instance.default"] #wait for the db to be ready
#   triggers = {
#     rds_users = sha256(jsonencode(var.rds_database))
#   }
#   provisioner "local-exec" {
#     interpreter = ["/bin/bash", "-c"]
#     command = <<EOF
#       for i in "${!local.rds_password_list}":
#       do
#         echo "key:$i"
#         echo "value:" ${local.rds_password_map[$i]}
#       done
#     EOF
    
#   }
# }

# resource "null_resource" "setup_db" {
#   depends_on = ["aws_db_instance.default"] #wait for the db to be ready
#   provisioner "local-exec" {
#     command = "mysql -u ${aws_db_instance.default.username} -p${random_password.master_password.result} -h ${aws_db_instance.default.address} < init.sql"
#   }
# }
# aws secretsmanager delete-secret --secret-id rds_credentials --force-delete-without-recovery --region ap-southeast-1
# aws secretsmanager describe-secret --secret-id credentials  --region ap-southeast-1
# aws secretsmanager get-secret-value --secret-id rds-user-credentials-apps-dev-sg  --region ap-southeast-1