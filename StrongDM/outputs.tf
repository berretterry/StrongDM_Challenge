#StrongDM SSH public Keys

output "sdm_web_server_public_key" {
  description = "StrongDM web-server public key"
  value = sdm_resource.bt_web_server.ssh[0].public_key
}

output "sdm_app_server_public_key" {
  description = "StrongDM app-server public key"
  value = sdm_resource.bt_app_server.ssh[0].public_key
}