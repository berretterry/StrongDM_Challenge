### Creating StrongDM resources

resource "sdm_resource" "mysql" {
  mysql {
    name = "sdm_database"
    hostname = aws_db_instance.sdm_database.endpoint
    username = var.mysql_username
    password = var.mysql_pass
    database = "sdm_database"
    port = 3306
  }
}

resource "sdm_resource" "sdm_challenge_app_server" {
  ssh {
    name = "sdm_challenge_app_server"
    hostname = aws_instance.app_server.private_ip
    username = "ubuntu"
    port = 22

  }

}

resource "sdm_resource" "sdm_challenge_web_server" {
  ssh {
    name = "sdm_challenge_web_server"
    hostname = aws_instance.web_server.private_ip
    username = "ubuntu"
    port = 22

  }

}