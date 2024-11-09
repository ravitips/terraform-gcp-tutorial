provider "google"{
    project = "august-tract-428308-h3"
    credentials = file("credentials/credentials.json")
    region = "asia-south1"
    zone = "asia-south1-a"
}
