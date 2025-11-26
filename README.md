# GitHub Action: Cloudron Push to App

This GitHub Action allows you to push your GitHub code to a specified Cloudron instance using the Cloudron CLI

## Inputs

- `cloudron-url`: The URL of your Cloudron instance e.g. `https://my.demo.cloudron.io`
- `cloudron-token`: The API token for authentication with your Cloudron instance - see [Cloudron api-tokens](https://docs.cloudron.io/profile/#api-tokens)
- `app-id`: Cloudron App ID to push the code to - this can also be a location slug e.g. `lamp` or full domain e.g. `lamp.demo.cloudron.io`
- `cloudron-cli-version`: (Optional) The version of the Cloudron CLI to use. Defaults to `6.0.0`.

## Example Usage

```yaml
name: Push to Cloudron
on: [push]
jobs:
  push-to-cloudron:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Push to Cloudron
        uses: your-username/cloudron-push-to-app@v1
        with:
          cloudron-url: ${{ secrets.CLOUDRON_URL }}
          cloudron-token: ${{ secrets.CLOUDRON_TOKEN }}
          app-id: your-app-id
```