-- Criando usuários e seus bancos de dados
-- ALTERE AS SENHAS ABAIXO
CREATE ROLE homarr            WITH LOGIN PASSWORD 'altere_esta_senha';
CREATE ROLE n8n               WITH LOGIN PASSWORD 'altere_esta_senha';
CREATE ROLE linkwarden        WITH LOGIN PASSWORD 'altere_esta_senha';
CREATE ROLE blinko            WITH LOGIN PASSWORD 'altere_esta_senha';
CREATE ROLE ezbookkeeping     WITH LOGIN PASSWORD 'altere_esta_senha';

CREATE DATABASE homarr        WITH OWNER homarr          ENCODING 'UTF8';
CREATE DATABASE n8n           WITH OWNER n8n             ENCODING 'UTF8';
CREATE DATABASE linkwarden    WITH OWNER linkwarden      ENCODING 'UTF8';
CREATE DATABASE blinko        WITH OWNER blinko          ENCODING 'UTF8';
CREATE DATABASE ezbookkeeping WITH OWNER ezbookkeeping   ENCODING 'UTF8';