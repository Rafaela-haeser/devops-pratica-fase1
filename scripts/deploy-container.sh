#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="devops-pratica-fase2:latest"
CONTAINER_NAME="devops-pratica-fase2-web"
HOST_PORT="8080"
CONTAINER_PORT="80"

echo "[deploy] Construindo imagem Docker: ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" .

echo "[deploy] Removendo container anterior, se existir"
docker rm -f "${CONTAINER_NAME}" 2>/dev/null || true

echo "[deploy] Iniciando novo container"
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  --restart unless-stopped \
  "${IMAGE_NAME}"

echo "[deploy] Validando endpoint local"
sleep 2
curl -fsS "http://localhost:${HOST_PORT}/health"

echo "[deploy] Aplicacao disponivel em http://localhost:${HOST_PORT}"
