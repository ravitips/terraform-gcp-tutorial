resource "google_compute_region_autoscaler" "vm_igm_autoscaler" {
  project = var.project_id
  name   = "vm-igm-autoscaler"
  region = var.gcp_region
  target = google_compute_region_instance_group_manager.igm_ravi.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
