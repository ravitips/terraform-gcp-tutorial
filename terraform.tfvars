project_id = "august-tract-428308-h3"
credentials_file = "credentials/credentials.json"
gcp_region = "asia-south1"
gcp_zone = "asia-south1-a"
services = [
        "compute.googleapis.com",
        "sql-component.googleapis.com",
        "sqladmin.googleapis.com",
    ]
auto_create_subnet = false
mtu = 1460
subnet_ip_range = [
        "10.0.1.0/24", #subenet_as1_1
    ]

vm_config={
    app_name = "business-app-1"
    short_app_name = "b-app-1"
    vm_name = "ravi-tf"
    vm_type = "e2-medium"
    vm_tags = ["http-server","allow-external","https-server"]                      #This is the network tag
    vm_image = "https://www.googleapis.com/compute/beta/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20241016"          #ubuntu-os-cloud/<image-name>
    boot_disk_type = "pd-ssd"
    boot_disk_size = 10
    vm_startup_script = "sudo apt-get update;sudo apt-get install nginx -y;sudo systemctl start nginx"
}

vm_template_config={
    app_name = "business-app"
    short_app_name = "b-app"
    vm_template_name = "ravi-tf-template"
    vm_template_disk_type = "e2-medium"
    vm_template_network_tags = ["http-server","allow-external","https-server"]                      #This is the network tag
    vm_template_disk_image = "https://www.googleapis.com/compute/beta/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20241016"          #ubuntu-os-cloud/<image-name>
    vm_template_boot_disk_type = "pd-ssd"
    vm_template_boot_disk_size = 10
    }

