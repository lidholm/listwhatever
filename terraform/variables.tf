variable "create_only_project" {
  type = bool
}

variable "billing_account_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "project_id" {
  type = string
  # typically project-name-XYZ123
}

variable "firebase_location" {
  type = string
  # https://firebase.google.com/docs/firestore/locations
}

variable "use_firestore" {
  type = bool
}

variable "use_web_app" {
  type = bool
}

variable "android_package_names" {
  type = map
  #    default = {
  #      "prod" = "com.example.hello"
  #      "stg"  = "com.example.hello.stg"
  #      "dev"  = "com.example.hello.dev"
  #    }
}

variable "android_sha1_hashes" {
  type = list
}

variable "android_sha256_hashes" {
  type = list
}

variable "use_ios_app" {
  type = bool
}

variable "ios_bundle_id" {
  type = string
}

variable "use_hosting" {
  type = bool
}

variable "use_cloud_storage" {
  type = bool
}

variable "use_authentication" {
  type = bool
}