# GitHub Action: Cloudron Push to App

This GitHub Action allows you to push your GitHub code to a specified Cloudron instance app using the Cloudron CLI

## Inputs

- `CLOUDRON_URL`: The URL of your Cloudron instance e.g. `https://my.demo.cloudron.io`
- `CLOUDRON_TOKEN`: The API token for authentication with your Cloudron instance - see [Cloudron api-tokens](https://docs.cloudron.io/profile/#api-tokens)
- `CLOUDRON_APP_ID`: Cloudron App ID to push the code to - this can also be a location slug e.g. `lamp` or full domain e.g. `lamp.demo.cloudron.io`
- `CLOUDRON_CLI_VERSION`: (Optional) The version of the Cloudron CLI to use. Defaults to `6.0.0`.
- `CLOUDRON_PUSH_DESTINATION`: (Optional) The destination path in the Cloudron app where the code should be pushed. Defaults to `/app/data/public`

## Example Usage

In your GitHub Project, create the folder `.github/workflows/` and add a file `deploy.yml` with the following content:

```yaml
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: my.cloudron.dev
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v6
      - name: Cloudron Push to App
        uses: cloudron-io/cloudron-push-to-app@latest
        with:
          CLOUDRON_TOKEN: "${{ secrets.CLOUDRON_URL }}"
          CLOUDRON_APP_ID: "${{ secrets.CLOUDRON_APP_ID }}"
          CLOUDRON_URL: "${{ secrets.CLOUDRON_TOKEN }}"
          CLOUDRON_PUSH_DESTINATION: "/app/data/public"

```
## Setting up Secrets

In your GitHub Project, navigate got `https://github.com/$YOUR-USERNAME/$YOUR-REPO-NAME/settings/environments` add an environment named after your Cloudron instance Domain e.g. `my.demo.cloudron.io` and add the following secrets:
- `CLOUDRON_URL`: Your Cloudron instance URL
- `CLOUDRON_TOKEN`: Your Cloudron API token
- `CLOUDRON_APP_ID`: The Cloudron App ID to push to
