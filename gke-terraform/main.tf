provider "google" {
    version = "~> 3.3"
    credentials = file(var.GCP_AUTH_JSON)   
    project     = var.GCP_PROJECT
    region      = var.GCP_REGION
}

resource "google_sql_database_instance" "cloudsql-db-master" {
  name = var.database_name
  database_version = var.database_version
  region = var.GCP_REGION

  settings {
    tier = "db-f1-micro"
    ip_configuration {
            ipv4_enabled = true
            require_ssl = false
            authorized_networks {
                name = "terraform-server-IP-whitelist"
                value = var.authorized_network
            }
        }
  }
}

resource "google_sql_user" "users" {
  name     = var.gcp_sql_root_user_name
  instance = google_sql_database_instance.cloudsql-db-master.name
  password = var.gcp_sql_root_user_pw
}

data "google_container_engine_versions" "cengine" {
  location       = var.GCP_ZONE
  version_prefix = "1.15."
}

resource "google_container_cluster" "dtrack_prod_cluster" {
    name = var.k8s_cluster_name
    description = "Dependency track cluster"
    location               = var.GCP_ZONE
    node_version       = data.google_container_engine_versions.cengine.latest_node_version
    min_master_version       = data.google_container_engine_versions.cengine.latest_node_version
    initial_node_count = var.initial_node_count
    remove_default_node_pool = true
    master_auth {
        username = var.master_username
        password = var.master_password

        client_certificate_config {
            issue_client_certificate = true
        }
    }

    maintenance_policy {
        daily_maintenance_window {
            start_time = "03:00"
        }
    }

    addons_config {
        horizontal_pod_autoscaling {
            disabled = true
        }
    }        
}

resource "google_container_node_pool" "dtrack_node_pool" {
    name       = "dtrack-node-pool"
    location   = var.GCP_ZONE
    cluster    = google_container_cluster.dtrack_prod_cluster.name

    node_config {
        image_type = "COS"
        machine_type = var.node_machine_type
        disk_size_gb = var.node_disk_size
        preemptible = true
        oauth_scopes = [
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring"
        ]
        metadata = {
            disable-legacy-endpoints = "true"
        }

        labels = {
            Purpose = "dtrack"
        }
        tags = ["java", "owasp", "appthreat"]
    }    

    timeouts {
        create = "30m"
        update = "40m"
    }

    management {
        auto_repair  = false
        auto_upgrade = false
    }
}
