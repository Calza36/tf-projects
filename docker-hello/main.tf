terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name         = "nginx:alpine"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.image_id // we aslo can use the name of the image like : docker_image.nginx.name (image_id)
  name  = var.container_name

  ports {
    internal = 80
    external = var.external_port
  }
}
