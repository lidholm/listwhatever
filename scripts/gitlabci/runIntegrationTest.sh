/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file=firebase-adminsdk-google-cloud-service-account.json
/google-cloud-sdk/bin/gcloud --quiet config set project listwhatever-ad43ed
/google-cloud-sdk/bin/gcloud firebase test android run \
    --type instrumentation  \
    --app app-development-debug.apk  \
    --test app-development-debug-androidTest.apk \
    --timeout 3m \
    --results-bucket=integration_results_listwhatever \
    --results-dir=test/firebase