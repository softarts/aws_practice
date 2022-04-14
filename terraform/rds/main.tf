module "mysql-mod" {
  source = "./mysql"
  app_name = var.app_name
  environment = var.environment
}

module "mysql-user" {
  source = "./config"
  app_name = var.app_name
  environment = var.environment
}

resource "local_file" "db-config" {
    content  = "mysql -uadmin -p${module.mysql-mod.password} -h ${module.mysql-mod.address} -e\"${join(" ", module.mysql-user.create_user_cmd_list)}\""
    filename = "${path.module}/db-config.sh"
}

# resource "null_resource" "post_config" {    
#   triggers = {
#     trigger_string = sha256(jsonencode(module.mysql-user.create_user_cmd_list))
#   }
#   provisioner "local-exec" {
#     interpreter = ["/bin/bash", "-c"]    
#     #command = "echo \"hello world! ${join(" ", module.mysql-user.create_user_cmd_list)} \""
#     command = "mysql -uadmin -p${module.mysql-mod.password} -h ${module.mysql-mod.address} -e\"${join(" ", module.mysql-user.create_user_cmd_list)}\""
#   }
# }

# command = "mysql -u ${aws_db_instance.default.username} -p${random_password.master_password.result} -h ${aws_db_instance.default.address} -e\"${join(" ", local.rds_password_list)}\""
# command = "echo -e\"${join(" ", module.mysql-user.create_user_cmd_list)}\""