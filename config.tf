provider "docker" {

}

resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_container" "webserver" {
  image = "nginx"
  name  = "webserver"
  ports {
    internal = 80
    external = 8080
  }
  volumes {
    container_path = "/etc/nginx/nginx.conf"
    host_path      = "/home/leonardo/projetos/terraform/webserver/nginx.conf"
    read_only      = true
  }
  
  volumes {
    volume_name    = "website"
    container_path = "/usr/share/nginx/html"
    host_path      = "/home/leonardo/projetos/terraform/site/"
    read_only      = true
  }
}

resource "docker_container" "frontend-1" {
  image = "nginx"
  name  = "frontend-1"
  ports {
    internal = 80
    external = 8081
  }
  volumes {
    volume_name    = "website"
    container_path = "/usr/share/nginx/html"
    host_path      = "/home/leonardo/projetos/terraform/site"
    read_only      = true
  }
}

resource "docker_container" "frontend-2" {
  image = "nginx"
  name  = "frontend-2"
  ports {
    internal = 80
    external = 8082
  }
  volumes {
    volume_name    = "website"
    container_path = "/usr/share/nginx/html"
    host_path      = "/home/leonardo/projetos/terraform/site"
    read_only      = true
  }
}