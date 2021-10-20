# Pulls the image
resource "docker_image" "code_server_proxy_image" {
  name = var.code_server_proxy_docker_image
}
resource "docker_image" "code_server_image" {
  name = var.code_server_docker_image
}

# Create a network
resource "docker_network" "code_server_network" {
  name = var.code_server_docker_network
}

# Create a proxy container
resource "docker_container" "code_server_proxy_container" {
  image = docker_image.code_server_proxy_image.name
  name  = "${var.resource_name_prefix}-proxy"
  networks_advanced {
    aliases = ["${var.resource_name_prefix}-proxy"]
    name    = docker_network.code_server_network.name
  }
  ports {
    external = var.code_server_proxy_port_external
    internal = var.code_server_proxy_port_internal
    protocol = "tcp"
  }
  restart = var.code_server_restart_policy
  upload {
    file    = "/etc/nginx/conf.d/default.conf"
    content = templatefile("${path.module}/conf/nginx/default.conf", {})
  }
}

# Create a Code Server container
resource "docker_container" "code_server_container" {
  env = [
    "DOCKER_USER=vagrant",
  ]
  image = docker_image.code_server_image.name
  name  = var.resource_name_prefix
  networks_advanced {
    aliases = ["${var.resource_name_prefix}"]
    name    = docker_network.code_server_network.name
  }
  ports {
    external = var.code_server_port_external
    internal = var.code_server_port_internal
    ip       = "127.0.0.1"
    protocol = "tcp"
  }
  restart = var.code_server_restart_policy
  user    = var.code_server_user
  upload {
    file = "/home/coder/.config/code-server/config.yaml"
    content = templatefile("${path.module}/conf/code-server/config.yaml",
      {
        password = var.code_server_password
        cert     = var.code_server_cert
      }
    )
  }
  upload {
    file = "/home/coder/.local/share/code-server/User/settings.json"
    content = templatefile("${path.module}/conf/code-server/settings.json",
      {}
    )
  }
  upload {
    file = "/tmp/rclone-tasks.json"
    content = templatefile("${path.module}/conf/code-server/rclone.json",
      {}
    )
  }
  volumes {
    container_path = "/home/coder/.local/share/code-server"
    host_path      = "/home/vagrant/.local/share/code-server"
  }
  volumes {
    container_path = "/home/coder/workspace/"
    host_path      = "/home/vagrant/"
  }
}
