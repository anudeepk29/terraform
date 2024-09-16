resource "google_compute_instance" "mlflow_instance" {
  name         = "mlflow-server"
  machine_type = "e2-medium"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    network = "default"

    access_config {
      # This is necessary to assign a public IP
    }
  }

  metadata_startup_script = <<-EOT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo docker run -d -p 5000:5000 \
      -e BACKEND_STORE_URI=postgresql://mlflow_user:${var.db_password}@${google_sql_database_instance.mlflow_db_instance.connection_name}/mlflow \
      -e ARTIFACT_ROOT=gs://my-mlflow-artifacts-bucket/ \
      --name mlflow mlflow/mlflow
  EOT

  tags = ["mlflow-server"]
}
