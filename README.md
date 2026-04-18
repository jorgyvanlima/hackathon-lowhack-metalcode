# Metal CODE — Equipe 343

Descrição
Projeto do time Metal CODE para o Hackathon LowHack 2026. Site estático servido por Nginx dentro de container Docker, com pipeline de deploy via GitHub Actions.

Visão rápida
- Aplicação estática em `site/` servida por Nginx
- Conteinerizada com `Dockerfile` e orquestrada por `docker-compose.yml`
- Deploy automático via GitHub Actions (SSH para VM) opcional

Estrutura do repositório
- `Dockerfile` — imagem baseada em Nginx para servir os arquivos estáticos
- `docker-compose.yml` — define o serviço `web`
- `nginx.conf` — configuração do Nginx
- `site/` — conteúdo estático (HTML, CSS, imagens)
- `.github/workflows/` — workflows de CI/CD (deploy)

Como rodar localmente

1. Build e executar com Docker Compose:

```bash
docker compose up -d --build
```

2. Abra `http://localhost` no navegador.

Como publicar no GitHub (fluxo básico)

1. Adicione e comite as mudanças locais:

```bash
git add README.md
git commit -m "Atualiza README"
```

2. Envie (push) para o repositório remoto configurado:

```bash
git push
```

Deploy via GitHub Actions (exigências)

No repositório GitHub, configure os Secrets abaixo (Settings → Secrets and variables → Actions):
- `SSH_PRIVATE_KEY` — chave privada para acessar a VM
- `SSH_USER` — usuário da VM (ex.: `jorgyvan_lima`)
- `SSH_HOST` — IP ou host da VM
- `SSH_PATH` — caminho do repositório na VM (ex.: `/home/jorgyvan_lima/hackthon-lowhack-metalcode`)

No servidor (VM), verifique:
- Docker instalado e em execução
- `docker compose` (plugin v2) disponível

O workflow típico fará `git pull` no servidor e executará `docker compose up -d --build`.

Observações de segurança
- Não exponha chaves ou tokens publicamente.
- Use chaves SSH com passphrase e gerencie acessos via GitHub.

Contato
- Maintainer: Metal CODE — equipe 343

---

Arquivo `site/` contém a página estática principal; ver [site/index.html](site/index.html) para conteúdo.
