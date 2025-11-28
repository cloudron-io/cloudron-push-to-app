FROM node:25-bookworm

ARG CLOUDRON_CLI_VERSION=6.0.0

WORKDIR /app/code/

ENV CLOUDRON_FQDN="my.demo.cloudron.io" \
    CLOUDRON_TOKEN="NOTOKEN" \
    CLOUDRON_APP_ID="NOAPPID" \
    CLOUDRON_PUSH_DESTINATION="/app/data/public/" \
    CLOUDRON_CREATE_APP_BACKUP="true"

COPY --from=mikefarah/yq:4.49.2 /usr/bin/yq /usr/bin/yq
COPY docker/ /

WORKDIR /app/code/

RUN mkdir -p /app/code/ && \
    npm install -g cloudron@${CLOUDRON_CLI_VERSION}

ENTRYPOINT ["/app/pkg/start.sh"]
# CMD ["/app/pkg/start.sh"]