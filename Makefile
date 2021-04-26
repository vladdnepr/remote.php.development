php:
	docker-compose exec php-fpm bash

up:
	docker-compose up -d

ps:
	docker-compose ps

down:
	docker-compose down

stop:
	docker-compose stop

build:
	docker-compose build

logs:
	docker-compose logs -f -t

# https://stackoverflow.com/a/6273809/12129932
%:
	@:

# Generate new https certs for Docker. Please use existing certs if it possible
generate-self-signed-certs:
	docker run --rm \
		-e ALTNAME='DNS:hello.local,DNS:*.hello.local' \
		-e CN='*.hello.local' \
		-e PRIVKEY_FILENAME='local.key' \
		-e CERT_FILENAME='local.crt' \
		-v=`pwd`/docker/nginx/certs:/certs jameskyburz/create-self-signed:latest

macos-add-cert-to-vault:
	sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./docker/nginx/certs/local.crt
