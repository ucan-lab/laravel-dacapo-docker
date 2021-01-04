up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	docker-compose up -d --build
	docker-compose exec app-6x composer install
	docker-compose exec app-6x cp .env.example .env
	docker-compose exec app-6x php artisan key:generate
	docker-compose exec app-6x php artisan dacapo:init --laravel6
	docker-compose exec app-6x php artisan dacapo
	docker-compose exec app-7x composer install
	docker-compose exec app-7x cp .env.example .env
	docker-compose exec app-7x php artisan key:generate
	docker-compose exec app-7x php artisan dacapo:init --laravel7
	docker-compose exec app-7x php artisan dacapo
	docker-compose exec app-8x composer install
	docker-compose exec app-8x cp .env.example .env
	docker-compose exec app-8x php artisan key:generate
	docker-compose exec app-8x php artisan dacapo:init --laravel8
	docker-compose exec app-8x php artisan dacapo
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
app-6x:
	docker-compose exec app-6x bash
app-7x:
	docker-compose exec app-7x bash
app-8x:
	docker-compose exec app-8x bash
