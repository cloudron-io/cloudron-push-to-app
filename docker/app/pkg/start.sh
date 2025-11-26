#!/bin/bash

set -eu -o pipefail
echo "==> Generating Cloudron config"
yq -n '.cloudrons.default = strenv(CLOUDRON_URL) | .cloudrons[strenv(CLOUDRON_URL)].apiEndpoint = strenv(CLOUDRON_URL) | .cloudrons[strenv(CLOUDRON_URL)].token = strenv(CLOUDRON_TOKEN)' --output-format=json > ~/.cloudron.json

echo "==> Pushing everything in $(pwd) to ${CLOUDRON_APP_ID} on ${CLOUDRON_URL} to destination ${CLOUDRON_PUSH_DESTINATION}"
cloudron push --app ${CLOUDRON_APP_ID} ${GITHUB_WORKSPACE}/. ${CLOUDRON_PUSH_DESTINATION}
