FROM alpine:latest as builder
ARG VERSION
ENV VERSION=${VERSION}
ADD https://download.sysdig.com/scanning/bin/sysdig-cli-scanner/${VERSION}/linux/amd64/sysdig-cli-scanner /
RUN chmod a+x /sysdig-cli-scanner
RUN apk update && apk add ca-certificates

FROM gcr.io/distroless/static-debian11
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /sysdig-cli-scanner /
ENTRYPOINT ["/sysdig-cli-scanner"]
