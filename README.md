## Construa e inicie os contêineres

Primeiro, construa e inicie o contêiner Docker com o comando:

```bash
docker-compose up --build
```

Exemplo de acesso via navegador: http://localhost:8080/app

### Habilitar portas personalizadas

Para configurar um projeto em *`src/<projeto>`* numa porta específica, devemos incluir/alterar algumas informações nos seguintes arquivos:

```
apache-config-laravel.conf (substituir a pasta <laravel>)

docker-compose.yml (adicionar exposição da porta e compartilhamento do apache-config-laravel.conf)

ports.conf (adicionar a porta)
```

## Guia rápido para projetos em Laravel

1. **Configure sua aplicação:**

	Dentro do contêiner `php`, execute os comandos:
	```
	composer install

	composer run post-root-package-install

	composer run post-create-project-cmd

	php artisan migrate

	php artisan db:seed

	chown -R www-data:www-data storage

	chmod -R 775 storage
	```
