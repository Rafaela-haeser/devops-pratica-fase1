#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="devops-pratica-fase2-web"
PREVIOUS_IMAGE="devops-pratica-fase2:previous"
HOST_PORT="8080"
CONTAINER_PORT="80"

echo "[rollback] Parando versao atual"
docker rm -f "${CONTAINER_NAME}" 2>/dev/null || true

echo "[rollback] Subindo imagem anterior: ${PREVIOUS_IMAGE}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  --restart unless-stopped \
  "${PREVIOUS_IMAGE}"

echo "[rollback] Validando endpoint local"
sleep 2
curl -fsS "http://localhost:${HOST_PORT}/health"
