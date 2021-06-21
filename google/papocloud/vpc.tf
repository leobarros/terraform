resource "google_compute_network" "vpc_network" {
  name                    = "dreamteam-vpc"
  auto_create_subnetworks = true
}