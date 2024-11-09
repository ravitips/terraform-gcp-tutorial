variable "project_id"{
    type = string
    description = "The Project ID I will be working with"
}

variable "credentials_file"{
    type = string
    description = "The json credential file to be used within the providers.tf file"
}

variable "gcp_region"{
    type = string
    description = "The Primary GCP region to deploy the resources"
    default = "asia-south1"
}

variable "gcp_zone"{
    type = string
    description = "The Primary GCP within the region"
    default = "asia-south1-a"
}

variable "services"{
    type = list(string)
    description = "The list of services that need to be enabled"
}

variable "auto_create_subnet"{
    type = bool
    description = "Tell whethere you need to create subnet automatically for this vpc or not"
    default =  false
}

variable "mtu"{
    type = number
    description = "The Maximum Transmission unit"
    default = 1460
}

variable "subnet_ip_range"{
    type = list(string)
    description = "The List of subnet ip to be used for created vpc"
}

variable "vm_config"{
    description = "The VM Configuration are listed here"
    type = object(
            {
                app_name = string
                short_app_name = string
                vm_name = string
                vm_type = string
                vm_tags = list(string)
                vm_image = string
                boot_disk_type = string
                boot_disk_size = number
                vm_startup_script = string
            }
        )
}

variable "vm_template_config"{
    description = "The VM Configuration are listed here"
    type = object(
            {
                app_name = string
                short_app_name = string
                vm_template_name = string
                vm_template_disk_type = string
                vm_template_network_tags = list(string)
                vm_template_disk_image = string
                vm_template_boot_disk_type = string
                vm_template_boot_disk_size = number
            }
        )
}
