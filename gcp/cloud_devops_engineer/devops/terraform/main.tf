resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20220118"
    }
  }

  network_interface {
    network = "default"
    subnetwork = "default"
  }

}