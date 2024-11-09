#GCS Bucket
resource "google_storage_bucket" "startup_script_bucket" {
  name          = "ravi-startup-script-bucket"
  location      = "asia-south1"
  storage_class = "STANDARD"
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
}


#Startup Script Object
resource "google_storage_bucket_object" "startup_script" {
  name   = "scripts/startup-script"                             #this means it creates a folder scripts and inside that the file(startup-script) is stored
  source = "./documents/startup_script.sh"
  bucket = google_storage_bucket.startup_script_bucket.name
}
