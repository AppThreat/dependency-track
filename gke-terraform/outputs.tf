output "connection_name" {
  value = google_sql_database_instance.cloudsql-db-master.connection_name
}

output "ip" {
  value = google_sql_database_instance.cloudsql-db-master.ip_address.0.ip_address
}

output "k8s_endpoint" {
  value = "${google_container_cluster.dtrack_prod_cluster.endpoint}"
}

output "k8s_master_version" {
  value = "${google_container_cluster.dtrack_prod_cluster.master_version}"
}

output "k8s_instance_group_urls" {
  value = "${google_container_cluster.dtrack_prod_cluster.instance_group_urls.0}"
}

output "k8s_master_auth_client_certificate" {
  value = "${google_container_cluster.dtrack_prod_cluster.master_auth.0.client_certificate}"
}

output "k8s_master_auth_client_key" {
  value = "${google_container_cluster.dtrack_prod_cluster.master_auth.0.client_key}"
}

output "k8s_master_auth_cluster_ca_certificate" {
  value = "${google_container_cluster.dtrack_prod_cluster.master_auth.0.cluster_ca_certificate}"
}

output "environment" {
  value = "${var.environment}"
}

