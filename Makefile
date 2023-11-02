run/api:
	go run ./cmd/api

db/psql:
	psql ${GREENLIGHT_DB_DSN}

db/migration/new:
	@echo 'Creating new migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

db/migration/up:
	@echo 'Running up migrations...'
	migrate -path ./migrations -database ${GREENLIGHT_DB_DSN} up