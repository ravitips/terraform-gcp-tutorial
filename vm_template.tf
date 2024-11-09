
resource "google_compute_instance_template" "instance_template_ravi" {
  project      = var.project_id
  name         = var.vm_template_config.vm_template_name
  machine_type = var.vm_template_config.vm_template_disk_type
  region       = var.gcp_region

  tags = var.vm_template_config.vm_template_network_tags

  labels = {
    environment    = "prod"
    app-name       = var.vm_template_config.app_name
    app-short-name = var.vm_template_config.short_app_name
    role           = "app"
  }

  disk {
    source_image = var.vm_template_config.vm_template_disk_image
    auto_delete  = true
    boot         = true
    disk_type    = var.vm_template_config.vm_template_boot_disk_type
    disk_size_gb = var.vm_template_config.vm_template_boot_disk_size

    labels = {
      disk-type = "boot"
      app-name  = var.vm_template_config.app_name
    }
  }

  metadata = {
    startup-script-url = "gs://${google_storage_bucket.startup_script_bucket.name}/${google_storage_bucket_object.startup_script.name}"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_as1_1.id
    access_config {
      // This block enables external IP
    }
  }


  service_account {
    email  = "svc-cloud-devops@august-tract-428308-h3.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  scheduling {
    preemptible        = false
    automatic_restart  = true
    provisioning_model = "STANDARD"
  }

}
