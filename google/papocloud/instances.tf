resource "google_compute_instance" "dreamteam" {
  name         = "dreamteam-web"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}