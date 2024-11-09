# Create a single Compute Engine instance
resource "google_compute_instance" "vm_ravi_tf" {
  name         = "vm-${var.vm_config.vm_name}"
  machine_type = var.vm_config.vm_type
  zone         = var.gcp_zone
  tags         = var.vm_config.vm_tags
  
  labels = {
      environment = "prod"
      app-name = var.vm_config.app_name
      app_short_name = var.vm_config.short_app_name
      vm-role = "app"
  }

  boot_disk {
    initialize_params {
      image = var.vm_config.vm_image
      size = var.vm_config.boot_disk_size
      type = var.vm_config.boot_disk_type
    }
  }

  # Install Flask
  metadata_startup_script = var.vm_config.vm_startup_script

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_as1_1.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
  
  service_account {
    email  = "svc-cloud-devops@august-tract-428308-h3.iam.gserviceaccount.com"  # Use your service account email
    scopes = ["cloud-platform"]  # Adjust scopes as necessary, This scope means all access which this service account has 
  }
  
  scheduling{
      preemptible = false
      automatic_restart = true
      provisioning_model = "STANDARD"
  }
} 
