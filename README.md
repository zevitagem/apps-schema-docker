## Construa e inicie os contêineres

Primeiro, construa e inicie o contêiner Docker com o comando:

```bash
docker-compose up --build
```

Exemplo de acesso via navegador: http://localhost:8080/app

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
