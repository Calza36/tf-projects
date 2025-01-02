variable "container_name" {
  type    = string
  default = "my-nginx-container"
  description = "Nombre del contenedor Docker"
}

variable "external_port" {
  type    = number
  default = 8080
  description = "Puerto externo para mapear el puerto 80 del contenedor"
}
