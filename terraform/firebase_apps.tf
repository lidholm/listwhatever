
# Create a Firebase Web App in the new project created above.
resource "google_firebase_web_app" "default" {
  count = (!var.create_only_project && var.use_web_app) ? 1 : 0
  provider = google-beta

  project         = google_firebase_project.default.project
  # TODO: REPLACE WITH YOUR OWN VALUE
  display_name    = "Production Web App"
  deletion_policy = "DELETE"
}

# Creates a Firebase Android App in the new project created above.
resource "google_firebase_android_app" "default" {
  for_each = var.create_only_project ? {} : var.android_package_names

  provider = google-beta

  project      = google_project.default.project_id
  display_name = "${each.key} Android app"
  package_name = each.value

  sha1_hashes = var.android_sha1_hashes
  sha256_hashes = var.android_sha256_hashes

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}

# Creates a Firebase iOS App in the new project created above.
resource "google_firebase_apple_app" "default" {
  count = (!var.create_only_project && var.use_web_app) ? 1 : 0

  provider = google-beta

  project      = google_project.default.project_id
  display_name = "iOS app"
  bundle_id = var.ios_bundle_id

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}