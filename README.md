# Meu Homelab

Este repositório contém os arquivos Docker Compose para a minha infraestrutura de homelab. Todos os serviços são orquestrados via Docker e utilizam uma rede interna chamada `local`.

## Estrutura da Rede

A rede `local` é uma rede externa do Docker onde cada contêiner possui um IP estático atribuído. Isso facilita a comunicação entre os serviços e a configuração do DNS. 

**Você terar que criar a rede `local` no docker e pode alterar os IPs para os que você desejar.**

### IPs Estáticos

**Infraestrutura Básica:**
- `10.10.1.2`: Traefik (Reverse Proxy)
- `10.10.1.3`: Cloudflared (DNS Proxy)
- `10.10.1.4`: Pi-hole (AdBlocker & DNS Local)
- `10.10.1.5`: Samba (Compartilhamento de Arquivos)

**Administração:**
- `10.10.1.10`: Homarr (Dashboard)
- `10.10.1.11`: Ntfy (Notificações)
- `10.10.1.12`: n8n (Automação)
- `10.10.1.13`: Syncthing (Sincronização de Arquivos)
- `10.10.1.14`: Harborguard

**Cofres e Documentos:**
- `10.10.1.20`: Vaultwarden (Gerenciador de Senhas)
- `10.10.1.21`: Linkwarden (Gerenciador de Links)
- `10.10.1.22`: Blinko (Notas)
- `10.10.1.23`: EzBookkeeping (Finanças)
- `10.10.1.24`: Stirling-PDF (Ferramentas PDF)
- `10.10.1.40`: MeiliSearch (Busca para Linkwarden)

**Outros:**
- `10.10.1.30`: Deluge (Torrent)
- `10.10.1.31`: LibreSpeed (Teste de Velocidade)
- `10.10.1.32`: PairDrop (Compartilhamento Local)

**Bancos de Dados:**
- `10.10.1.50`: PostgreSQL Prod
- `10.10.1.51`: PostgreSQL Dev
- `10.10.1.52`: Redis Prod
- `10.10.1.53`: Redis Dev

### IPs internos

- `Rede Interna`: 172.20.0.0/24
- `DNS`: Watchtower (Monitoramento de atualizações)

## Variáveis de Ambiente

Para rodar este projeto, você precisará criar um arquivo `.env` ou configurar as variáveis de ambiente no seu sistema. Abaixo está a lista de variáveis necessárias e suas descrições.

### Gerais
| Variável | Descrição | Exemplo |
|---|---|---|
| `DOMAIN` | Seu domínio principal. | `exemplo.com.br` |
| `TZ` | Fuso horário dos contêineres. | `America/Sao_Paulo` |

### Principal.yml
| Variável | Descrição |
|---|---|
| `CF_DNS_API_TOKEN` | Token da API do Cloudflare para desafio DNS-01 (Traefik). |
| `TS_AUTH_KEY` | Chave de autenticação do Tailscale. |
| `TS_ROUTES` | Rotas que o Tailscale deve anunciar (ex: `10.10.0.0/22`). |
| `SB_USER` | Usuário para o Samba. |
| `SB_PASSWORD` | Senha para o Samba. |
| `SB_PERMISSIONS` | Permissões do Samba (ex: `true`). |
| `SB_NAME` | Nome do compartilhamento Samba. |
| `SB_DIRECTORY` | Caminho local para compartilhar via Samba. |
| `SB_BROWSABLE` | Se o compartilhamento é navegável (`yes`/`no`). |
| `SB_READONLY` | Se o compartilhamento é somente leitura (`yes`/`no`). |
| `SB_GUEST` | Se permite convidado (`yes`/`no`). |
| `WATCHTOWER_TOPIC` | Topico que será usado para avisar novas atualizações |

### Admin.yml
| Variável | Descrição |
|---|---|
| `HOMARR_ENCRYPTION_KEY` | Chave de encriptação para o Homarr (string aleatória longa). |
| `HOMARR_DB_DATABASE` | Nome do banco de dados do Homarr. |
| `HOMARR_DB_HOST` | Host do banco de dados do Homarr. |
| `HOMARR_DB_PORT` | Porta do banco de dados do Homarr. |
| `HOMARR_DB_USER` | Usuário do banco de dados do Homarr. |
| `HOMARR_DB_PASSWORD` | Senha do banco de dados do Homarr. |
| `HOMARR_REDIS_HOST` | Host do Redis para o Homarr. |
| `HOMARR_REDIS_PORT` | Porta do Redis para o Homarr. |
| `HOMARR_REDIS_USERNAME` | Usuário do Redis para o Homarr. |
| `HOMARR_REDIS_PASSWORD` | Senha do Redis para o Homarr. |
| `HOMARR_REDIS_IDX` | Índice do banco Redis para o Homarr. |
| `N8N_ENCRYPTION_KEY` | Chave de encriptação para o n8n. |
| `N8N_DB_DATABASE` | Nome do banco de dados do n8n. |
| `N8N_DB_HOST` | Host do banco de dados do n8n. |
| `N8N_DB_PORT` | Porta do banco de dados do n8n. |
| `N8N_DB_USER` | Usuário do banco de dados do n8n. |
| `N8N_DB_SCHEMA` | Schema do banco de dados do n8n. |
| `N8N_DB_PASSWORD` | Senha do banco de dados do n8n. |

### Cofres.yml
| Variável | Descrição |
|---|---|
| `LINK_DB_HOST` | Host do banco de dados do Linkwarden. |
| `LINK_DB_DATABASE` | Nome do banco de dados do Linkwarden. |
| `LINK_DB_USER` | Usuário do banco de dados do Linkwarden. |
| `LINK_DB_PASSWORD` | Senha do banco de dados do Linkwarden. |
| `LINK_SECRET` | Segredo para autenticação do Linkwarden (NextAuth). |
| `MEILI_MASTER_KEY` | Chave mestra para o MeiliSearch. |
| `OLLAMA_ENDPOINT` | URL do endpoint do Ollama (ex: `http://10.10.2.110:11434`). |
| `OLLAMA_MODEL` | Modelo do Ollama a ser usado (ex: `gemma3:4b`). |

### Documentos.yml
| Variável | Descrição |
|---|---|
| `BLINKO_DB_HOST` | Host do banco de dados do Blinko. |
| `BLINKO_DB_DATABASE` | Nome do banco de dados do Blinko. |
| `BLINKO_DB_USER` | Usuário do banco de dados do Blinko. |
| `BLINKO_DB_PASSWORD` | Senha do banco de dados do Blinko. |
| `BLINKO_SECRET` | Segredo para autenticação do Blinko (NextAuth). |
| `EBK_DB_HOST` | Host do banco de dados do EzBookkeeping. |
| `EBK_DB_DATABASE` | Nome do banco de dados do EzBookkeeping. |
| `EBK_DB_USER` | Usuário do banco de dados do EzBookkeeping. |
| `EBK_DB_PASSWORD` | Senha do banco de dados do EzBookkeeping. |
| `EBK_SECRET` | Chave secreta de segurança do EzBookkeeping. |
| `EBK_AI_URL` | URL da IA para reconhecimento de imagem no EzBookkeeping. |
| `EBK_AI_MODEL` | Modelo de IA para o EzBookkeeping. |

### Databases.yml
| Variável | Descrição |
|---|---|
| `PROD_PG_USER` | Usuário do PostgreSQL (Prod). |
| `PROD_PG_PASSWORD` | Senha do PostgreSQL (Prod). |
| `PROD_PG_DATABASE` | Banco de dados padrão do PostgreSQL (Prod). |
| `DEV_PG_USER` | Usuário do PostgreSQL (Dev). |
| `DEV_PG_PASSWORD` | Senha do PostgreSQL (Dev). |
| `DEV_PG_DATABASE` | Banco de dados padrão do PostgreSQL (Dev). |
| `PROD_REDIS_USERNAME` | Usuário do Redis (Prod). |
| `PROD_REDIS_PASSWORD` | Senha do Redis (Prod). |
| `DEV_REDIS_USERNAME` | Usuário do Redis (Dev). |
| `DEV_REDIS_PASSWORD` | Senha do Redis (Dev). |

### Outros.yml
| Variável | Descrição |
|---|---|
| `DELUGE_FOLDER` | Caminho local para a pasta de downloads do Deluge. |

## Banco de Dados (Databases.sql)

O arquivo `Databases.sql` contém os comandos SQL para criar os usuários e bancos de dados necessários para os serviços.
**IMPORTANTE:** Edite este arquivo e altere as senhas padrão (`123456`) antes de inicializar o banco de dados.

## Futuro

Planos para futuras implementações na infraestrutura:

- [ ] **Grafana**: Para visualização de métricas e dashboards.
- [ ] **Loki**: Para agregação e consulta de logs.
- [ ] **Prometheus**: Para coleta de métricas dos serviços.
