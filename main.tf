//create a vpc

resource "google_compute_network" "vpc_network" {
 project = "es-devops-sb"
 name = "vpc-network-jenkins"
 auto_create_subnetworks = false
 mtu = 1460

}
//creates firewall rule

resource "google_compute_firewall" "vpc_network" {

name = var.firewall-name
network = google_compute_network.vpc_network.name

allow {

 protocol = "tcp"
 ports = ["80", "22"]

}
//source_tags = ["web"]

 target_tags = ["sample"]
 source_ranges = ["0.0.0.0/0"]

}
//create a subnet

resource "google_compute_subnetwork" "network-with-ip-ranges" {
 name = var.subnet1-name
 ip_cidr_range = var.subnet1-cidr
 region = var.subnet1-region
 network  = google_compute_network.vpc_network.id
 private_ip_google_access = true

}

resource "google_compute_subnetwork" "network-with-ip-ranges-1" {
 name = var.subnet2-name
 ip_cidr_range = var.subnet2-cidr
 region = var.subnet2-region
 network  = google_compute_network.vpc_network.id
 private_ip_google_access = true
}
# creating service account
resource "google_service_account" "service_account" {
  account_id   = var.sa-id
  display_name = var.sa-name
}

# Creating cluster 

resource "google_container_cluster" "primary" {
  name     = var.cluster-name
  location = var.cluster-location

  remove_default_node_pool = true
  initial_node_count       = 1
}

# Creating a nodepool for the cluster
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepool-name
  location   = var.nodepool-location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    service_account = google_service_account.service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
