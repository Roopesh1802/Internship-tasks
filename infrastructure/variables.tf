variable "project-name" {
    type = string
    default = "vpc-network-jenkins"
}

variable "firewall-name" {
    type = string
    default = "test-firewall"
}

variable "subnet1-name" {
    type = string
    default = "subnet-3"
}

variable "subnet1-cidr" {
    type = string
    default = "10.20.0.0/24"
}

variable "subnet1-region" {
    type = string
    default = "us-central1"
}

variable "subnet2-name" {
    type = string
    default = "subnet-4"
}

variable "subnet2-cidr" {
    type = string
    default = "10.32.0.0/24"
}

variable "subnet2-region" {
    type = string
    default = "us-west1"
}

variable "sa-name"{
    type = string 
    default = "terraform-for-task"
}

variable "sa-id"{
    type = string 
    default = "terraform-sa"
}

variable "cluster-name"{
    type = string 
    default = "my-first-gke-cluster"
}

variable "cluster-location"{
    type = string 
    default = "us-central1"
}

variable "nodepool-name"{
    type = string 
    default = "my-first-node-pool"
}

variable "nodepool-location"{
    type = string 
    default = "us-central1"
}
