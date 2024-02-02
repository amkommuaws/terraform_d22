variable "db_password" {
  description = "password for sql"
  type = string
  default = "Gcp@2024"
  sensitive = false # this will only hide , the value from plan, and output as well 
}

provider "google" {
  region = "us-central1"
  project = "nice-carving-411801"
  credentials = file("credentials.json")
}

# Create a cloud sql resource in gcp
resource "google_sql_database_instance" "my_instance" {
  name = "dev-instance"
  database_version = "MYSQL_8_0"
  root_password = var.db_password
  settings {
    tier    = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name = "everyone"
        value = "0.0.0.0/0"
      }
    }
}
}