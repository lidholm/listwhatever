# Enable required APIs for Cloud Storage for Firebase.
resource "google_project_service" "storage" {
  for_each = (!var.create_only_project && var.use_cloud_storage) ? toset([
    "firebasestorage.googleapis.com",
    "storage.googleapis.com",
  ]) : toset([])

  provider = google-beta

  project = google_firebase_project.default.project
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Provision the default Cloud Storage bucket for the project via Google App Engine.
resource "google_app_engine_application" "default" {
  count = !var.create_only_project && var.use_cloud_storage ? 1 : 0

  provider = google-beta

  project     = google_firebase_project.default.project
  # See available locations: https://firebase.google.com/docs/projects/locations#default-cloud-location
  # This will set the location for the default Storage bucket and the App Engine App.
  location_id = var.firebase_location

  # Wait until Firestore is provisioned first.
  depends_on = [
    google_firestore_database.default
  ]
}

# Make the default Storage bucket accessible for Firebase SDKs, authentication, and Firebase Security Rules.
resource "google_firebase_storage_bucket" "default_bucket" {
  count = !var.create_only_project && var.use_cloud_storage ? 1 : 0

  provider = google-beta

  project   = google_firebase_project.default.project
  bucket_id = one(google_app_engine_application.default).default_bucket

  depends_on = [
    google_project_service.storage
  ]
}

# Create a ruleset of Cloud Storage Security Rules from a local file.
resource "google_firebaserules_ruleset" "storage" {
  count = !var.create_only_project && var.use_cloud_storage ? 1 : 0

  provider = google-beta

  project = google_firebase_project.default.project
  source {
    files {
      # Write security rules in a local file named "storage.rules".
      # Learn more: https://firebase.google.com/docs/storage/security/get-started
      name    = "storage.rules"
      content = file("../storage.rules")
    }
  }

  # Wait for the default Storage bucket to be provisioned before creating this ruleset.
  depends_on = [
    google_firebase_storage_bucket.default_bucket,
  ]
}

# Release the ruleset to the default Storage bucket.
resource "google_firebaserules_release" "default_bucket" {
  count = !var.create_only_project && var.use_cloud_storage ? 1 : 0

  provider = google-beta

  name         = "firebase.storage/${one(google_app_engine_application.default).default_bucket}"
  ruleset_name = "projects/${google_firebase_project.default.project}/rulesets/${one(google_firebaserules_ruleset.storage).name}"
  project      = google_firebase_project.default.project

  lifecycle {
    replace_triggered_by = [
      google_firebaserules_ruleset.storage
    ]
  }
}
