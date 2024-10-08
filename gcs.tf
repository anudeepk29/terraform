resource "google_storage_bucket" "mlflow_artifacts" {
  name     = "my-mlflow-jlkijuejd-bucket"
  location = var.region

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}
