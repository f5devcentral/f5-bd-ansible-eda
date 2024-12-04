#!/bin/bash

# Replace [MyInstance_ID] and [MyAPIToken] with your Dynatrace Instance ID and Token (No Brackets)

export DT_ENDPOINT="https://[MyInstance].live.dynatrace.com/api/v2/otlp"
export API_TOKEN="[MyAPIToken]"

podman pull dynatrace/edgeconnect:latest
podman run --name dt-edgeconn --mount type=bind,src="$PWD"/edgeConnect.yaml,dst=/edgeConnect.yaml -d --restart always dynatrace/edgeconnect

podman run --name dt-otelcol --env DT_ENDPOINT="$DT_ENDPOINT" --env API_TOKEN="$API_TOKEN" -p 5678:5678 -v /dynatrace/collector.yaml:/collector.yaml -d --restart always ghcr.io/dynatrace/dynatrace-otel-collector/dynatrace-otel-collector:latest --config collector.yaml
