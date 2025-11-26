# GitHub Action: Cloudron Push to App

This GitHub Action allows you to push your GitHub code to a specified Cloudron instance app using the Cloudron CLI.

## Inputs

- `CLOUDRON_URL`: The URL of your Cloudron instance e.g. `my.demo.cloudron.io`
- `CLOUDRON_TOKEN`: The API token for authentication with your Cloudron instance - see [Cloudron api-tokens](https://docs.cloudron.io/profile/#api-tokens)
- `CLOUDRON_APP_ID`: Cloudron App ID to push the code to - this can also be a location slug e.g. `lamp` or full domain e.g. `lamp.demo.cloudron.io`
- `CLOUDRON_CLI_VERSION`: (Optional) The version of the Cloudron CLI to use. Defaults to `6.0.0`.
- `CLOUDRON_PUSH_DESTINATION`: (Optional) The destination path in the Cloudron app where the code should be pushed. Defaults to `/app/data/public`
- `CLOUDRON_CREATE_APP_BACKUP`: (Optional) Whether to create a backup of the Cloudron app before pushing new code. Defaults to `true`.

## Example Usage

In your GitHub Project, create the folder `.github/workflows/` and add a file `deploy.yml` with the following content:

```yaml
on:
  push:
    branches:
      - main
jobs:
  deploy-to-cloudron-app:
    runs-on: ubuntu-latest
    environment: my.demo.cloudron.io
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
          CLOUDRON_CREATE_APP_BACKUP: "true"

```
## Setting up Secrets

In your GitHub Project, navigate got `https://github.com/$YOUR-USERNAME/$YOUR-REPO-NAME/settings/environments` add an environment named after your Cloudron instance domain e.g. `my.demo.cloudron.io` and add the following secrets:
- `CLOUDRON_URL`: Your Cloudron instance URL (e.g. `my.demo.cloudron.io`)
- `CLOUDRON_TOKEN`: Your Cloudron API token
- `CLOUDRON_APP_ID`: The Cloudron App ID to push to

## Final Notes

When you have followed these steps, every push to the `main` branch will automatically deploy your code to the specified Cloudron app.
