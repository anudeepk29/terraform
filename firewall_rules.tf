resource "google_compute_firewall" "mlflow_firewall" {
  name    = "mlflow-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mlflow-server"]
}
