variable "project" {}

resource "google_sql_database_instance" "master" {
  region = "europe-west1"
  project = "${var.project}"

  settings {
    tier = "D0"
  }
}

resource "google_sql_database" "users" {
  name      = "users-db"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
  project = "${var.project}"
}
