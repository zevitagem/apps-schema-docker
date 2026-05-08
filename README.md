# apps-puro

Stack Docker com dois projetos PHP independentes + MySQL + phpMyAdmin, cada app servido em sua própria porta.

## Estrutura

```
apps-puro/
├── docker-compose.yml
├── apache-config-php.conf          # vhost do app `php` (porta 80 interna)
├── apache-config-php-custom.conf   # vhost do app `php-custom` (porta 82 interna)
├── ports-php.conf                  # Listen 80
├── ports-php-custom.conf           # Listen 82
├── images/
│   ├── php/Dockerfile              # imagem PHP+Apache parametrizada por APP_PATH
│   ├── mysql/Dockerfile
│   └── phpmyadmin/Dockerfile
└── src/
    ├── php/index.php               # código do app `php`
    └── php-custom/index.php        # código do app `php-custom`
```

## Mapeamento de portas

| URL                    | Container    | DocumentRoot               |
|------------------------|--------------|----------------------------|
| http://localhost:8080  | `php`        | `/var/www/html/php`        |
| http://localhost:8082  | `php-custom` | `/var/www/html/php-custom` |
| http://localhost:3305  | `phpmyadmin` | —                          |
| `localhost:3306`       | `mysql`      | —                          |

## Subir o ambiente

```bash
docker-compose up --build -d
```

Depois abra:

- http://localhost:8080 → app `php`
- http://localhost:8082 → app `php-custom`

## Como adicionar um novo app (ex.: `php-novo`)

1. Crie a pasta com o código:

   ```
   src/php-novo/index.php
   ```

2. Duplique e ajuste os arquivos de Apache:

   - `apache-config-php-novo.conf` — troque a porta no `<VirtualHost *:NN>` e o `DocumentRoot /var/www/html/php-novo`
   - `ports-php-novo.conf` — troque o `Listen NN`

3. Adicione um serviço novo no `docker-compose.yml` espelhando o bloco do `php`/`php-custom`. Os pontos a alterar:

   ```yaml
   php-novo:
       container_name: php-novo
       build:
           context: ./
           dockerfile: images/php/Dockerfile
           args:
               APP_PATH: php-novo                     # <-- nome da pasta em src/
       ports:
           - "8084:NN"                                # <-- porta externa:interna
       volumes:
           - ./apache-config-php-novo.conf:/etc/apache2/sites-enabled/000-default.conf
           - ./ports-php-novo.conf:/etc/apache2/ports.conf
           - type: bind
             source: ./src/php-novo                   # <-- pasta específica do app
             target: /var/www/html/php-novo
   ```

   > Importante: o `target:` do bind mount deve apontar para `/var/www/html/<nome>`, **não** para `/var/www/html`. Caso contrário o Apache lista todas as subpastas em vez do app.

   > Importante: monte a config como `000-default.conf` (e não `001-...`). A imagem `php:8.1-apache` já vem com um `000-default.conf` ativo apontando para `/var/www/html`; se você não sobrescrever, ele vence o seu vhost na porta 80.

## Detalhes da imagem PHP

`images/php/Dockerfile` recebe `APP_PATH` como build arg e copia somente a pasta correspondente:

```dockerfile
ARG APP_PATH
COPY src/${APP_PATH}/ /var/www/html/${APP_PATH}/
```

Assim cada imagem fica enxuta (só com seu próprio código) e o cache de build de um app não é invalidado por mudanças em outro.

## Banco de dados

- Host (de dentro dos containers PHP): `mysql`
- Porta: `3306`
- Usuário: `root`
- Senha: vazia (`MYSQL_ALLOW_EMPTY_PASSWORD=yes`)
- phpMyAdmin: http://localhost:3305

Os dados ficam persistidos em `./storage/mysql`.
