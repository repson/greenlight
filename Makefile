include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

# ==================================================================================== #
# DEVELOPMENT
# ==================================================================================== #

## run/api: run the cmd/api application
.PHONY: run/api
run/api:
	@go run ./cmd/api -db-dsn=${GREENLIGHT_DB_DSN}

## db/psql: connect to the database using psql
.PHONY: db/psql
db/psql:
	psql ${GREENLIGHT_DB_DSN}

## db/migration/new name=$1: create a new database migration
.PHONY: db/migration/new
db/migration/new:
	@echo 'Creating new migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

## db/migration/down: apply all up database migrations
.PHONY: db/migration/up
db/migration/up: confirm
	@echo 'Running up migrations...'
	migrate -path ./migrations -database ${GREENLIGHT_DB_DSN} up

# ==================================================================================== #
# QUALITY CONTROL
# ==================================================================================== #

## audit: tidy and vendor dependencies and format, vet and test all code
.PHONY: audit
audit: vendor
	@echo 'Formatting source code...'
	go fmt ./...
	@echo 'Vetting source code...'
	go vet ./...
	staticcheck ./...
	@echo 'Running tests...'
	go test -race -vet=off ./...

## vendor: tidy and vendor dependencies
.PHONY: vendor
vendor:
	@echo 'Tidying and verifying module dependencies...'
	go mod tidy
	go mod verify
	@echo 'Vendoring module dependencies...'
	go mod vendor