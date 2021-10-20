module "code-server" {
  source = "../.."

  # consul
  consul_tags = ["code-server"]

  # code_server
  resource_name_prefix            = "code-server"
  code_server_docker_image        = "pmikus/docker-code-server-base:latest"
  code_server_proxy_docker_image  = "nginx:stable"
  code_server_docker_network      = "code_server_network"
  code_server_restart_policy      = "unless-stopped"
  code_server_proxy_port_internal = 80
  code_server_proxy_port_external = 80
  code_server_port_internal       = 8443
  code_server_port_external       = 8443
  code_server_user                = "1000:1000"
  code_server_password            = "28cc31eb07175f727e155ec8"
  code_server_cert                = true
}
