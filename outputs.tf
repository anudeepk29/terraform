# outputs.tf

output "mlflow_server_ip" {
  value = google_compute_instance.mlflow_instance.network_interface[0].access_config[0].nat_ip
}
