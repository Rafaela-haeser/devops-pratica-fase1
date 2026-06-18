# DevOps na Pratica - Fase 2

## Repositorio

https://github.com/Rafaela-haeser/devops-pratica-fase1

## 1. Pipeline de Entrega Continua

A Fase 2 expandiu o pipeline da Fase 1 para contemplar entrega continua. O workflow `CI/CD - DevOps Fase 2`, criado em `.github/workflows/ci-cd.yml`, executa automaticamente a validacao do codigo, dos testes, da infraestrutura, da imagem Docker, da auditoria de dependencias e do deploy continuo.

Etapas do pipeline:

1. Checkout do codigo no GitHub Actions.
2. Configuracao do Node.js.
3. Instalacao de dependencias.
4. Execucao dos testes automatizados.
5. Execucao do build da aplicacao.
6. Validacao dos scripts Terraform.
7. Build da imagem Docker.
8. Execucao do container e validacao do endpoint `/health`.
9. Auditoria de dependencias com `npm audit`.
10. Deploy continuo no GitHub Pages quando a branch `main` e atualizada.

## 2. Containers e Orquestracao

A aplicacao foi containerizada utilizando Docker. O `Dockerfile` usa uma estrategia em duas etapas: primeiro realiza o build com Node.js e depois publica os arquivos estaticos em uma imagem Nginx.

Arquivos criados:

- `Dockerfile`: define a imagem Docker da aplicacao.
- `nginx.conf`: configura o servidor Nginx e o endpoint `/health`.
- `docker-compose.yml`: permite executar a aplicacao localmente com Docker Compose.
- `scripts/deploy-container.sh`: automatiza build e deploy local do container.
- `scripts/rollback-container.sh`: estrutura inicial para rollback utilizando imagem anterior.

Comandos principais:

```bash
docker build -t devops-pratica-fase2:latest .
docker run -d --name devops-pratica-fase2-web -p 8080:80 devops-pratica-fase2:latest
curl http://localhost:8080/health
```

## 3. Monitoramento, Logging e Seguranca

A solucao inclui um endpoint `/health`, utilizado pelo pipeline para validar se o container esta respondendo corretamente. Como proposta de evolucao, o projeto pode ser integrado a ferramentas como Prometheus e Grafana para coleta e visualizacao de metricas e a ELK Stack para logging centralizado.

Na parte de seguranca, o pipeline inclui auditoria de dependencias por meio do `npm audit --audit-level=high`, alem da recomendacao de evoluir para analise estatica e dinamica com SonarQube, OWASP ZAP ou ferramentas equivalentes.

## 4. Fluxo DevOps Implementado

Fluxo resumido:

1. Alteracao no codigo.
2. Commit e push na branch `main`.
3. GitHub Actions executa o pipeline.
4. CI valida testes, build e Terraform.
5. Docker cria e valida o container.
6. Auditoria de dependencias verifica riscos de seguranca.
7. CD publica a aplicacao no GitHub Pages.
8. Resultados sao avaliados para melhoria continua.

## 5. Analise dos Resultados

O pipeline automatizado reduziu atividades manuais e passou a fornecer feedback rapido sobre falhas de codigo, testes, infraestrutura e containerizacao. A validacao do container aumenta a confiabilidade da entrega, pois garante que a aplicacao pode ser executada em ambiente isolado e reprodutivel.

A entrega continua via GitHub Pages demonstra a publicacao automatizada da aplicacao apos a aprovacao das etapas anteriores. Isso reforca os principios DevOps de automacao, feedback continuo, rastreabilidade e melhoria continua.

## 6. Melhorias Futuras

- Publicar imagem Docker em um registry, como GitHub Container Registry ou Docker Hub.
- Implantar a imagem em um servico de orquestracao, como Amazon ECS, EKS ou Kubernetes.
- Adicionar monitoramento com Prometheus e dashboards no Grafana.
- Implementar logging centralizado com ELK Stack.
- Integrar analise de qualidade e seguranca com SonarQube.
- Executar testes de carga com JMeter ou ferramenta equivalente.
- Configurar rollback automatico em caso de falha no deploy.
