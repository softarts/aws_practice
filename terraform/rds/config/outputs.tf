output "create_user_cmd_list" {
    value = [
        for el in var.rds_users: 
            format("CREATE USER '%s' IDENTIFIED BY '%s';",el,random_password.rds_userpassword[el].result)
    ]
    description = "create_user_cmd_list"
    sensitive = false
}

