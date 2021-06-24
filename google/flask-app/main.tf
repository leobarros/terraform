provider "google" {
  project = "papo-cloud"
  region  = "us-west1"
  zone    = "us-west1-b"
}

// terraform plugin for creating radom ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine istance
resource "google_compute_instance" "default" {
  name         = "flask-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"

  metadata = {
    ssh-keys = "terraform:${file("~/.ssh/terraform.pub")}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Make sure flash is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}

resource "google_compute_firewall" "default" {
    name = "flash-app-firewall"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["5000"]
    }
}