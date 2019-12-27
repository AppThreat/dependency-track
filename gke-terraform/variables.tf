variable "GCP_AUTH_JSON" {

}
variable "GCP_PROJECT" {
    type = string
    description = "Project id"
}

variable "GCP_REGION" {
    type = string
    description = "Region"
    default = "europe-west2"
}

variable "GCP_ZONE" {
    type = string
    description = "Region"
    default = "europe-west2-b"
}

variable "gcp_sql_root_user_name" {
  default = "deptrack-root"
}

variable "gcp_sql_root_user_pw" {}

variable "authorized_network" {}

variable "database_name" {
  default = "deptrack-master"
}

variable "database_version" {
  default = "MYSQL_5_7"
}

variable "k8s_cluster_name" {
    description = "GKE cluster name"
    default = "dtrack-prod-cluster"
}

variable "initial_node_count" {
  description = "Number of worker VMs to initially create"
  default = 1
}

variable "master_username" {
  description = "Username for accessing the Kubernetes master endpoint"
  default = "dtrack-k8s-master"
}

variable "master_password" {
  description = "Password for accessing the Kubernetes master endpoint"
}

variable "node_machine_type" {
  description = "GCE machine type"
  default = "n1-standard-1"
}

variable "node_disk_size" {
  description = "Node disk size in GB"
  default = "20"
}

variable "environment" {
  description = "value passed to Environment tag"
  default = "dtrack-prod"
}
