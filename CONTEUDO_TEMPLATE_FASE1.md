# Conteúdo sugerido para preencher o template da Fase 1

Substitua os campos entre colchetes antes de entregar.

## Capa

**Nome do estudante:** [SEU NOME]

**Projeto:** DevOps na Prática — Fase 1: Configuração e Automação Inicial

**Repositório GitHub:** https://github.com/[SEU-USUARIO]/devops-pratica-fase1

---

## Seção 1 — a) Descrição do projeto, objetivos e requisitos

O projeto desenvolvido para a Fase 1 da disciplina DevOps na Prática consiste em uma aplicação web simples, versionada no GitHub, com pipeline de Integração Contínua configurado por meio do GitHub Actions e scripts de Infraestrutura como Código desenvolvidos com Terraform.

A aplicação tem como objetivo demonstrar, de forma prática, a configuração inicial de um fluxo DevOps. O projeto contempla controle de versão, automação de testes, build da aplicação e validação dos scripts de infraestrutura. A infraestrutura proposta representa um ambiente de hospedagem de site estático na AWS, utilizando Amazon S3, descrito de forma declarativa em arquivos Terraform.

Objetivos do projeto:
- criar um repositório de código no GitHub;
- organizar uma aplicação simples com estrutura versionável;
- implementar testes automatizados;
- configurar um pipeline de CI com GitHub Actions;
- validar automaticamente a aplicação a cada push ou pull request;
- desenvolver scripts Terraform para provisionamento de infraestrutura;
- validar os scripts de infraestrutura no pipeline;
- documentar o planejamento, o pipeline e a infraestrutura necessária.

Requisitos funcionais:
- a aplicação deve possuir uma página web inicial;
- a aplicação deve exibir uma mensagem de status do pipeline;
- o projeto deve possuir testes automatizados;
- o pipeline deve executar os testes automaticamente;
- o repositório deve conter scripts de infraestrutura como código.

Requisitos não funcionais:
- o código deve estar versionado no GitHub;
- o pipeline deve executar automaticamente em alterações na branch main;
- os scripts de infraestrutura devem ser reutilizáveis e versionados;
- a infraestrutura deve ser descrita por código;
- o projeto deve permitir rastreabilidade das alterações por commits;
- a execução do pipeline deve gerar feedback rápido sobre falhas.

Link do repositório:
https://github.com/[SEU-USUARIO]/devops-pratica-fase1

---

## Seção 1 — b) Plano de integração contínua

O plano de Integração Contínua adotado tem como objetivo garantir que toda alteração enviada ao repositório seja validada automaticamente. A cada push ou pull request para a branch main, o GitHub Actions executa o pipeline definido no arquivo .github/workflows/ci.yml.

Fluxo planejado:
1. O desenvolvedor realiza alterações no código.
2. As alterações são enviadas ao GitHub por meio de commit e push.
3. O GitHub Actions dispara automaticamente o pipeline de CI.
4. O pipeline baixa o código do repositório.
5. O ambiente Node.js é configurado.
6. As dependências do projeto são instaladas.
7. Os testes automatizados são executados.
8. O build da aplicação é executado.
9. O ambiente Terraform é configurado.
10. Os arquivos Terraform são verificados quanto à formatação.
11. A configuração Terraform é validada.
12. O GitHub Actions apresenta o resultado da execução.

Ferramenta utilizada:
- GitHub Actions.

Arquivo do pipeline:
- .github/workflows/ci.yml

Gatilhos configurados:
- push na branch main;
- pull_request para a branch main;
- execução manual por workflow_dispatch.

Critérios de sucesso:
- todos os testes automatizados devem passar;
- o build da aplicação deve ser concluído com sucesso;
- o comando terraform fmt -check -recursive deve ser aprovado;
- o comando terraform validate deve ser concluído sem erros;
- a execução do workflow deve aparecer com status verde na aba Actions do GitHub.

Link do workflow:
https://github.com/[SEU-USUARIO]/devops-pratica-fase1/actions/workflows/ci.yml

---

## Seção 1 — c) Especificação detalhada da infraestrutura necessária

A infraestrutura necessária para o projeto foi especificada com Terraform, utilizando a abordagem de Infraestrutura como Código. A proposta é provisionar um ambiente simples para hospedagem de site estático na AWS por meio do Amazon S3.

Componentes previstos:
- Amazon S3 Bucket: armazenamento dos arquivos estáticos da aplicação;
- configuração de static website hosting: permite hospedar o conteúdo HTML, CSS e JavaScript;
- política de leitura pública: permite acesso ao conteúdo do site estático;
- configuração de região AWS: parametrizada por variável;
- outputs Terraform: exibem o nome do bucket e o endpoint do site.

Arquivos Terraform:
- infra/versions.tf: define a versão mínima do Terraform e os providers necessários;
- infra/variables.tf: define variáveis como região AWS e nome do projeto;
- infra/main.tf: descreve os recursos de infraestrutura;
- infra/outputs.tf: define as saídas da infraestrutura.

Requisitos de infraestrutura:
- conta AWS para aplicação real dos scripts;
- Terraform instalado localmente ou configurado no pipeline;
- permissões AWS para criação e configuração de bucket S3;
- bucket com nome globalmente único;
- controle de acesso compatível com hospedagem pública de site estático.

Nesta fase, o pipeline realiza a validação dos scripts Terraform. A aplicação efetiva da infraestrutura com terraform apply pode ser executada posteriormente, após configuração segura de credenciais AWS.

---

## Seção 2 — a) Configuração de um repositório de código

O repositório foi criado no GitHub com o nome devops-pratica-fase1.

Link do repositório:
https://github.com/[SEU-USUARIO]/devops-pratica-fase1

Estrutura principal do repositório:
- src/: código da aplicação web;
- tests/: testes automatizados;
- scripts/: script de build;
- infra/: scripts Terraform de infraestrutura como código;
- .github/workflows/: configuração do pipeline GitHub Actions;
- README.md: documentação do projeto;
- package.json: configuração dos scripts Node.js.

Evidências recomendadas:
- print da página inicial do repositório no GitHub;
- print da estrutura de arquivos;
- print do arquivo README.md.

---

## Seção 2 — b) Implementação de um pipeline de CI usando GitHub Actions

O pipeline de Integração Contínua foi implementado utilizando GitHub Actions, no arquivo .github/workflows/ci.yml.

Link do workflow:
https://github.com/[SEU-USUARIO]/devops-pratica-fase1/actions/workflows/ci.yml

Jobs configurados:
1. Testes e build da aplicação:
   - checkout do código;
   - configuração do Node.js;
   - instalação de dependências;
   - execução dos testes automatizados;
   - execução do build.

2. Validação dos scripts Terraform:
   - checkout do código;
   - configuração do Terraform;
   - terraform init -backend=false;
   - terraform fmt -check -recursive;
   - terraform validate.

O pipeline foi configurado para executar automaticamente a cada push e pull request na branch main. Também foi habilitada execução manual por workflow_dispatch.

Evidências recomendadas:
- print da aba Actions;
- print do workflow executado com sucesso;
- print dos jobs app-ci e terraform-validate concluídos com status verde.

---

## Seção 3 — a) Scripts para provisionamento de infraestrutura a partir da ferramenta

A ferramenta escolhida para Infraestrutura como Código foi o Terraform.

Link dos scripts:
https://github.com/[SEU-USUARIO]/devops-pratica-fase1/tree/main/infra

Os scripts foram organizados na pasta infra/ e têm como objetivo provisionar um bucket Amazon S3 configurado para hospedagem de site estático.

Arquivos criados:
- versions.tf;
- variables.tf;
- main.tf;
- outputs.tf.

Recursos descritos:
- provider AWS;
- geração de sufixo aleatório para nome único do bucket;
- bucket S3;
- configuração de hospedagem estática;
- configuração de acesso público para leitura;
- política IAM de leitura pública;
- outputs com nome do bucket e endpoint do site.

Comandos de validação:
terraform init -backend=false
terraform fmt -check -recursive
terraform validate

O pipeline de CI executa esses comandos automaticamente para garantir que os scripts de infraestrutura estejam corretamente formatados e válidos.

Evidências recomendadas:
- print da pasta infra/ no GitHub;
- print do arquivo main.tf;
- print do job terraform-validate concluído com sucesso no GitHub Actions.
