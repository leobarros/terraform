provider "docker" {

}

resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_container" "webserver" {
  count = 2
  image = "nginx"
  name  = "webserver-${count.index+1}"
  ports {
    internal = 80
  }
  volumes {
      container_path = "/usr/share/nginx/html"
      host_path = "/home/leonardo/projetos/terraform/site/"
      read_only = true
  }
}