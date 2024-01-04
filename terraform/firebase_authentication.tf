# UNCOMMENT BELOW IF YOU SET UP FIREBASE AUTHENTICATION USING TERRAFORM IN THE PREVIOUS STEP
# # Enable the Identity Toolkit API.
resource "google_project_service" "auth" {
  for_each = var.use_authentication ? toset([
    "identitytoolkit.googleapis.com",
    "people.googleapis.com"
  ]) : toset([])

  provider = google-beta

  project = google_firebase_project.default.project
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# # Create an Identity Platform config.
# # Also, enable Firebase Authentication using Identity Platform (if Authentication isn't yet enabled).
# resource "google_identity_platform_config" "auth" {
#   provider = google-beta
#   project  = google_firebase_project.default.project

#   # For example, you can configure to auto-delete anonymous users.
#   autodelete_anonymous_users = true

#   # Wait for identitytoolkit.googleapis.com to be enabled before initializing Authentication.
#   depends_on = [
#     google_project_service.auth,
#   ]
# }

# variable "oauth_client_secret" {
#   type = string

#   description = "OAuth client secret. For this codelab, you can pass in this secret through the environment variable TF_VAR_oauth_client_secret. In a real app, you should use a secret manager service."

#   sensitive = true
# }

# resource "google_identity_platform_default_supported_idp_config" "google_sign_in" {
#   provider = google-beta
#   project  = google_firebase_project.default.project

#   enabled       = true
#   idp_id        = "google.com"
#   # TODO: REPLACE WITH YOUR OWN VALUE
#   client_id     = "<YOUR_OAUTH_CLIENT_ID>"
#   client_secret = var.oauth_client_secret

#   depends_on = [
#     google_identity_platform_config.auth
#   ]
# }
