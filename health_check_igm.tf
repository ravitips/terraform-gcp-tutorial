resource "google_compute_health_check" "hc_tcp_8888" {
  name    = "hc-tcp-8888"
  project = var.project_id

  timeout_sec         = 15
  check_interval_sec  = 15
  healthy_threshold   = 2
  unhealthy_threshold = 3

  tcp_health_check {
    port = "8888"
  }
}
