resource "google_compute_region_instance_group_manager" "igm_ravi" {
  name    = "igm-ravi"
  project = var.project_id

  base_instance_name = "vm-igm"
  region             = var.gcp_region

  version {
    instance_template = google_compute_instance_template.instance_template_ravi.self_link_unique
  }
  
  #below target size is not required when you have configured autoscaler
  #target_size = 3    

  named_port {
    name = "app-port"
    port = 8888
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.hc_tcp_8888.id
    initial_delay_sec = 300
  }

 }
