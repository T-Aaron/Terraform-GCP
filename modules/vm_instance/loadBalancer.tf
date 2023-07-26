resource "google_compute_address" "ip_static_lb" {
  name = "ip-static-lb"
}

resource "google_compute_http_health_check" "load-balancer-health-checks" {
  name               = "lb-health-checks"
  request_path       = "/"
  port               = 80
  check_interval_sec = 10
  timeout_sec        = 3
}

resource "google_compute_target_pool" "lb-target-pool" {
  name             = "lb-target-pool"
  session_affinity = "NONE"
  region           = var.region

  instances = [ google_compute_instance.web-server.self_link ]

  health_checks = [
    google_compute_http_health_check.load-balancer-health-checks.name
  ]

  depends_on = [google_compute_instance.web-server]
}

resource "google_compute_forwarding_rule" "network-load-balancer" {
  name                  = "lb-net-rule"
  region                = var.region
  target                = google_compute_target_pool.lb-target-pool.self_link
  ip_address            = google_compute_address.ip_static_lb.address
  port_range            = "80-443"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
}
