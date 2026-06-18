# Conteudo para preencher o Template - Fase 2

## Capa

Nome do estudante: RAFAELA CHANDELIER HAESER

Projeto: DevOps na Pratica - Fase 2: Entrega Continua, Monitoramento e Seguranca

Repositorio: https://github.com/Rafaela-haeser/devops-pratica-fase1

---

## Secao 1 - a) Expansao do pipeline de CI para inclusao da Entrega Continua (CD)

O pipeline da Fase 1 foi expandido para um fluxo completo de CI/CD. Alem das validacoes de integracao continua ja existentes, o novo workflow inclui build de container Docker, validacao de execucao do container, auditoria de dependencias e deploy continuo da aplicacao no GitHub Pages.

O workflow foi criado no arquivo `.github/workflows/ci-cd.yml` com o nome `CI/CD - DevOps Fase 2`.

Etapas implementadas:
- checkout do codigo no GitHub Actions;
- configuracao do ambiente Node.js;
- instalacao de dependencias;
- execucao dos testes automatizados;
- build da aplicacao;
- validacao dos scripts Terraform;
- build da imagem Docker;
- execucao do container e validacao do endpoint `/health`;
- auditoria de dependencias com `npm audit`;
- deploy continuo no GitHub Pages quando ha push na branch main.

Criterios de sucesso:
- testes automatizados aprovados;
- build finalizado sem erro;
- Terraform validado;
- imagem Docker construida com sucesso;
- container respondendo ao endpoint de saude;
- auditoria de seguranca sem vulnerabilidades altas;
- deploy concluido no GitHub Pages.

Link do workflow:
https://github.com/Rafaela-haeser/devops-pratica-fase1/actions

---

## Secao 2 - a) Containerizacao da aplicacao utilizando Docker

A aplicacao foi containerizada com Docker para garantir portabilidade, isolamento e reprodutibilidade do ambiente. O Dockerfile foi construido em duas etapas: a primeira utiliza Node.js para instalar dependencias e gerar o build; a segunda utiliza Nginx para servir os arquivos estaticos da aplicacao.

Arquivos criados:
- `Dockerfile`: define a construcao da imagem Docker;
- `nginx.conf`: configura o servidor Nginx e o endpoint `/health`;
- `docker-compose.yml`: permite executar a aplicacao localmente em container;
- `.dockerignore`: evita copiar arquivos desnecessarios para a imagem.

Comandos de validacao:
- `docker build -t devops-pratica-fase2:latest .`
- `docker run -d --name devops-pratica-fase2-web -p 8080:80 devops-pratica-fase2:latest`
- `curl http://localhost:8080/health`

Link do repositorio:
https://github.com/Rafaela-haeser/devops-pratica-fase1

---

## Secao 2 - b) Scripts de deploy usando os containers

Foram criados scripts para automatizar o deploy local da aplicacao containerizada. O script `scripts/deploy-container.sh` constroi a imagem Docker, remove uma execucao anterior, inicia um novo container e valida a disponibilidade pelo endpoint `/health`.

Tambem foi criado o script `scripts/rollback-container.sh` como base para retorno a uma imagem anterior em caso de falha.

Scripts criados:
- `scripts/deploy-container.sh`: build e deploy local do container;
- `scripts/rollback-container.sh`: estrutura de rollback;
- `docker-compose.yml`: execucao padronizada da aplicacao com Docker Compose.

Fluxo do deploy containerizado:
1. Construir imagem Docker.
2. Remover container antigo, caso exista.
3. Subir novo container.
4. Mapear porta 8080 local para porta 80 do container.
5. Validar o endpoint `/health`.
6. Disponibilizar a aplicacao em `http://localhost:8080`.

Link dos scripts:
https://github.com/Rafaela-haeser/devops-pratica-fase1/tree/main/scripts

---

## Secao 3 - a) Relatorio detalhado das etapas do projeto - Fase 1

Na Fase 1 foi realizada a configuracao inicial do projeto DevOps. O repositorio foi criado no GitHub, a aplicacao web foi versionada, os testes automatizados foram implementados e o pipeline de integracao continua foi configurado com GitHub Actions.

Principais entregas da Fase 1:
- criacao do repositorio no GitHub;
- organizacao do codigo da aplicacao;
- criacao da pasta `infra/` com scripts Terraform;
- configuracao do workflow inicial de CI;
- execucao automatizada de testes;
- execucao do build da aplicacao;
- validacao dos arquivos Terraform;
- evidencias da execucao com sucesso na aba Actions.

Resultado da Fase 1:
A base do projeto ficou preparada para receber a expansao de entrega continua, containerizacao e melhoria do ciclo DevOps na Fase 2.

---

## Secao 3 - a) Relatorio detalhado das etapas do projeto - Fase 2

Na Fase 2, o projeto foi evoluido para incluir entrega continua, containerizacao, scripts de deploy, validacao de seguranca e documentacao do fluxo DevOps completo.

Principais entregas da Fase 2:
- criacao do workflow `ci-cd.yml`;
- inclusao de etapa de deploy continuo no GitHub Pages;
- criacao do Dockerfile;
- criacao da configuracao Nginx;
- criacao do docker-compose.yml;
- criacao de scripts de deploy e rollback;
- validacao automatica do container;
- auditoria de dependencias com npm audit;
- documentacao do fluxo DevOps e das melhorias futuras.

Resultado da Fase 2:
O projeto passou a ter um fluxo automatizado mais completo, cobrindo integracao, build, testes, infraestrutura, container, seguranca basica e entrega continua.

---

## Secao 3 - b) Demonstracao pratica de todo o fluxo DevOps implementado

Fluxo implementado:
1. O desenvolvedor altera o codigo.
2. Realiza commit e push na branch main.
3. O GitHub Actions inicia o pipeline CI/CD.
4. O pipeline instala dependencias.
5. Executa testes automatizados.
6. Gera o build da aplicacao.
7. Valida scripts Terraform.
8. Constroi a imagem Docker.
9. Executa o container e valida o endpoint de saude.
10. Executa auditoria de dependencias.
11. Publica a aplicacao via GitHub Pages.
12. Resultados sao avaliados para melhoria continua.

---

## Secao 3 - c) Analise dos resultados e sugestao de melhorias futuras

A evolucao da Fase 2 demonstrou a aplicacao pratica dos principios DevOps: automacao, feedback rapido, rastreabilidade, entrega continua e melhoria continua. O pipeline passou a validar nao apenas o codigo e a infraestrutura, mas tambem a execucao da aplicacao em container.

Resultados obtidos:
- reducao de processos manuais;
- maior confiabilidade da entrega;
- validacao automatica dos testes;
- padronizacao do ambiente com Docker;
- validacao da infraestrutura com Terraform;
- publicacao automatizada por CD;
- seguranca inicial por auditoria de dependencias.

Melhorias futuras:
- publicar a imagem no GitHub Container Registry ou Docker Hub;
- implantar o container em Amazon ECS, EKS ou Kubernetes;
- adicionar monitoramento com Prometheus e Grafana;
- implementar logging centralizado com ELK Stack;
- integrar SonarQube para qualidade e seguranca de codigo;
- executar testes de carga com JMeter;
- implementar rollback automatico;
- criar ambientes separados de desenvolvimento, homologacao e producao.
