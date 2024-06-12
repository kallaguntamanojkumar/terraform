terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  count = 100
  name  = "nginx${count.index +1}"
  ports {
    internal = 80
    external = 0
  }
}

/*resource "docker_image" "ubuntu" {
  name         = "ubuntu:precise"
  keep_locally = false
}

resource "docker_container" "ubuntu" {
  image = docker_image.ubuntu.image_id
  name  = "ubuntu"
}*/
