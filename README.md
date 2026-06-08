# DevOps na Prática — Fase 1

Projeto desenvolvido para a Fase 1 do curso **DevOps na Prática**.

## Objetivo

Demonstrar uma configuração inicial de DevOps com:

- repositório versionado no GitHub;
- pipeline de Integração Contínua com GitHub Actions;
- testes automatizados integrados ao pipeline;
- scripts de Infraestrutura como Código com Terraform;
- validação automática dos scripts de infraestrutura no pipeline.

## Estrutura do projeto

```text
.
├── .github/workflows/ci.yml
├── infra/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── versions.tf
├── scripts/
│   └── build.js
├── src/
│   ├── app.js
│   ├── index.html
│   └── style.css
├── tests/
│   └── app.test.js
├── package.json
└── README.md
```

## Como executar localmente

```bash
npm install
npm test
npm run build
```

## Como validar a infraestrutura localmente

```bash
cd infra
terraform init -backend=false
terraform fmt -check -recursive
terraform validate
```

## Pipeline de CI

O pipeline está configurado em:

```text
.github/workflows/ci.yml
```

Ele executa automaticamente em `push`, `pull_request` e também manualmente por `workflow_dispatch`.

Etapas principais:

1. baixa o código do repositório;
2. configura o Node.js;
3. instala dependências;
4. executa testes automatizados;
5. executa build;
6. configura Terraform;
7. valida formatação dos arquivos `.tf`;
8. valida a infraestrutura com `terraform validate`.

## Infraestrutura como Código

A infraestrutura está descrita na pasta `infra/` e prevê o provisionamento de um bucket Amazon S3 configurado para hospedagem de site estático.

> Observação: na Fase 1, o pipeline valida os scripts de infraestrutura. A aplicação real da infraestrutura (`terraform apply`) pode ser feita posteriormente, com credenciais AWS adequadas.
