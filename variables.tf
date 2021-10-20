variable "resource_name_prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "code-server"
}

variable "code_server_docker_image" {
  description = "Code-server docker image"
  type        = string
  default     = "pmikus/docker-code-server-base:latest"
}

variable "code_server_proxy_docker_image" {
  description = "Nginx docker image"
  type        = string
  default     = "nginx:stable"
}

variable "code_server_docker_network" {
  description = "Docker network"
  type        = string
  default     = "code_server_network"
}

variable "code_server_restart_policy" {
  description = "Containers restart policy"
  type        = string
  default     = "unless-stopped"
}

variable "code_server_proxy_port_internal" {
  description = "Code-server proxy container internal port"
  type        = number
  default     = 80
}

variable "code_server_proxy_port_external" {
  description = "Code-server proxy container external port"
  type        = number
  default     = 80
}

variable "code_server_port_internal" {
  description = "Code-server container internal port"
  type        = number
  default     = 8443
}

variable "code_server_port_external" {
  description = "Code-server container external port"
  type        = number
  default     = 8443
}

variable "code_server_user" {
  description = "Code-server container user to run under"
  type        = string
  default     = "1000:1000"
}

variable "code_server_password" {
  description = "Code-server password"
  type        = string
  default     = "28cc31eb07175f727e155ec8"
  sensitive   = true
}

variable "code_server_cert" {
  description = "Use certificate for Code-server"
  type        = bool
  default     = true
}