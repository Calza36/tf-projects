output "container_id" {
  description = "El ID del contenedor Docker"
  value       = docker_container.nginx_container.id
}
