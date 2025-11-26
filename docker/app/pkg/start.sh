#!/bin/bash

set -eu -o pipefail
echo "==> Generating Cloudron config"
yq -n '.cloudrons.default = strenv(CLOUDRON_URL) | .cloudrons[strenv(CLOUDRON_URL)].apiEndpoint = strenv(CLOUDRON_URL) | .cloudrons[strenv(CLOUDRON_URL)].token = strenv(CLOUDRON_TOKEN)' --output-format=json > ~/.cloudron.json

if [[ ${CLOUDRON_CREATE_APP_BACKUP} == "true" ]]; then
    echo "==> Creating a Cloudron app backup before pushing new code"
    cloudron backup create --app ${CLOUDRON_APP_ID}
else
    echo "==> Variable CLOUDRON_CREATE_APP_BACKUP is set to ${CLOUDRON_CREATE_APP_BACKUP} - Skipping Cloudron app backup before pushing new code"
fi

echo "==> Pushing everything in $(pwd) to ${CLOUDRON_APP_ID} on ${CLOUDRON_URL} to destination ${CLOUDRON_PUSH_DESTINATION}"
cloudron push --app ${CLOUDRON_APP_ID} ${GITHUB_WORKSPACE}/. ${CLOUDRON_PUSH_DESTINATION}
