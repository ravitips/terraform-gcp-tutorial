resource "google_compute_network" "vpc_network_1" {
  project                 = var.project_id
  name                    = "vpc-1"
  auto_create_subnetworks = var.auto_create_subnet
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "subnet_as1_1" {
  project       = var.project_id
  name          = "subnet-as1-1"
  ip_cidr_range = var.subnet_ip_range[0]
  region        = var.gcp_region
  network       = google_compute_network.vpc_network_1.id     #terraform automatically generates the vpc id
}







#vpc sharing - setting up host
#resource "google_compute_shared_vpc_host_project" "vpc_network_host" {
#  project = var.project_id
#}

#To use Shared VPC, your host project must be part of an organization.

#vpc sharing - setting up service project which uses the host (currently im not using any,you can configure in future if required)
#resource "google_compute_shared_vpc_service_project" "vpc_network_service" {
#  host_project    = google_compute_shared_vpc_host_project.vpc_network_host.project
#  service_project = "service-project-id-1"
#}

