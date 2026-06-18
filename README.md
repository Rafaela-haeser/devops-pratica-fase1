# DevOps na Pratica - Fases 1 e 2

Projeto pratico da disciplina **DevOps na Pratica**.

## Objetivo

Demonstrar um fluxo DevOps com:

- controle de versao no GitHub;
- pipeline de CI com GitHub Actions;
- testes automatizados;
- validacao de Infraestrutura como Codigo com Terraform;
- containerizacao com Docker;
- validacao automatizada do container;
- auditoria basica de seguranca;
- entrega continua com GitHub Pages.

## Estrutura

```text
.github/workflows/ci-cd.yml   # Pipeline CI/CD da Fase 2
infra/                        # Scripts Terraform
src/                          # Codigo da aplicacao
scripts/                      # Build e scripts de deploy
tests/                        # Testes automatizados
Dockerfile                    # Container da aplicacao
docker-compose.yml            # Execucao local com Docker Compose
nginx.conf                    # Configuracao do Nginx no container
RELATORIO_FASE2.md            # Relatorio final da Fase 2
```

## Comandos locais

```bash
npm install
npm test
npm run build
```

## Docker

```bash
docker build -t devops-pratica-fase2:latest .
docker run -d --name devops-pratica-fase2-web -p 8080:80 devops-pratica-fase2:latest
curl http://localhost:8080/health
```

Ou com Docker Compose:

```bash
docker compose up --build
```

## Deploy local com script

```bash
bash scripts/deploy-container.sh
```

## Pipeline CI/CD

O workflow `CI/CD - DevOps Fase 2` executa:

1. testes automatizados;
2. build da aplicacao;
3. validacao Terraform;
4. build e validacao Docker;
5. auditoria de dependencias;
6. deploy continuo no GitHub Pages.
```
