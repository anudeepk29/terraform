resource "google_sql_database_instance" "mlflow_db_instance" {
  name             = "mlflow-db-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "mlflow_db" {
  name     = "mlflow"
  instance = google_sql_database_instance.mlflow_db_instance.name
}

resource "google_sql_user" "mlflow_db_user" {
  name     = "mlflow_user"
  instance = google_sql_database_instance.mlflow_db_instance.name
  password = var.db_password
}
