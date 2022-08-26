FROM alpine:latest

ARG VERSION
ENV VERSION=${VERSION}

ADD https://download.sysdig.com/scanning/bin/sysdig-cli-scanner/${VERSION}/linux/amd64/sysdig-cli-scanner /
RUN chmod a+x /sysdig-cli-scanner
ENTRYPOINT ["/sysdig-cli-scanner"]
