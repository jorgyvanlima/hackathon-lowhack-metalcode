# Metal CODE — Equipe 343

Página de apresentação da equipe Metal CODE para o Hackathon LOW CODE 2026.

Visão rápida
- Projeto 100% Docker (Nginx servindo página estática)
- Deploy automático via GitHub Actions (SSH para a VM) com `docker compose up -d --build`

Estrutura
- `Dockerfile` — imagem baseada em `nginx` com site estático
- `docker-compose.yml` — orquestra o serviço `web`
- `nginx.conf` — configuração do servidor
- `site/` — HTML/CSS/ativos da página
- `.github/workflows/deploy.yml` — pipeline de deploy (SSH)

Como rodar localmente

1. Build e rodar com docker-compose:

```bash
docker compose up -d --build
```

2. Abrir `http://localhost` no navegador.

GitHub Actions & Deploy remoto

Requisitos no servidor remoto (VM):
- Docker instalado e em execução
- `docker compose` disponível (plugin compose v2)
- Repositório já clonado no caminho definido no Secret `SSH_PATH`

Secrets necessários no GitHub (Settings → Secrets and variables → Actions):
- `SSH_PRIVATE_KEY` — chave privada para SSH
- `SSH_USER` — usuário da VM (ex.: `jorgyvan_lima`)
- `SSH_HOST` — IP público da VM
- `SSH_PATH` — caminho do repositório na VM (ex.: `/home/jorgyvan_lima/hackathon-lowhack-metalcode`)

O workflow fará `git pull` e executará `docker compose up -d --build` na VM.

Observações de segurança
- Nunca exponha tokens ou chaves em canais públicos. Revogue tokens vazados.# Hackathon LowHack - Metalcode

Repositório base do hackathon.

Infra:
- Google Cloud VM (Ubuntu 22.04)
- Deploy automático via GitHub Actions
