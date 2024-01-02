
create_only_project = false

# https://console.cloud.google.com/billing/
billing_account_id = "01CF33-40FE66-2D6E9F"

project_name = "listwhatever"
project_id = "listwhatever-ad43ed"
# See available locations:
# https://firebase.google.com/docs/firestore/locations
# https://firebase.google.com/docs/projects/locations#default-cloud-location
firebase_location = "us-west2"
use_firestore = true
use_web_app = true
android_package_names = {
        "prod" = "com.anywhostudios.listwhatever"
        "stg"  = "com.anywhostudios.listwhatever.stg"
        "dev"  = "com.anywhostudios.listwhatever.dev"
}
android_sha1_hashes = [
        "cd:60:0e:d3:59:58:af:53:ba:95:5a:c6:49:da:64:c8:0b:8a:e8:9d",
        "e0:9f:32:1b:fc:02:4f:17:a3:6c:d4:4f:90:9b:95:eb:b3:66:c4:95",
        "50:ec:fd:1f:9d:d7:dd:6c:cd:29:2d:33:e6:92:e9:23:ab:8d:99:1e",
]
android_sha256_hashes = [
        "13:68:d8:45:80:5d:5a:94:31:1b:aa:b8:a6:e2:78:e0:5e:97:1d:de:92:7d:4e:24:35:72:63:59:00:4b:9d:4c",
        "79:b1:60:6d:81:e4:9b:85:c3:d1:86:0e:7d:49:f3:7a:47:83:19:7c:fc:f9:53:df:8f:d9:41:96:72:e4:90:38"
]

use_ios_app = true
ios_bundle_id = "com.anywhostudios.listwhatever"
use_hosting = true
use_cloud_storage = true
use_authentication = true
