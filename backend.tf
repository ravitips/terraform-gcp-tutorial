terraform{
    backend "gcs"{
        bucket = "august-tract-428308-h3-terraform-remote-backend"
        prefix = "terraform/state"
        credentials = "credentials/credentials.json"
    }
}

