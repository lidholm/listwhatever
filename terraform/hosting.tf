
resource "google_firebase_hosting_site" "full" {

  count = (!var.create_only_project && var.use_web_app) ? 1 : 0

  provider = google-beta
  project  = google_project.default.project_id
  site_id = "${var.project_id}-other2"
}
