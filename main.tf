resource "google_storage_bucket" "default" {
  name     = "${var.project_id}-terraform-remote-backend"
  location = "asia-south1"

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
}


#enabling the Cloud Resource manager api
resource "google_project_service" "crm_service" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
  disable_dependent_services = true
}

#enabling other services
resource "google_project_service" "cloud_services" {
  count = length(var.services)
  project = var.project_id
  service = var.services[count.index]

  disable_on_destroy = false
  disable_dependent_services = true
}
