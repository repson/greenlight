## help: print this help message
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

confirm:
	@echo 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## run/api: run the cmd/api application
run/api:
	go run ./cmd/api

## db/psql: connect to the database using psql
db/psql:
	psql ${GREENLIGHT_DB_DSN}

## db/migration/new name=$1: create a new database migration
db/migration/new:
	@echo 'Creating new migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

## db/migration/down: apply all up database migrations
db/migration/up: confirm
	@echo 'Running up migrations...'
	migrate -path ./migrations -database ${GREENLIGHT_DB_DSN} up