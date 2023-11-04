# greenlight

## Description

This application is a JSON API for retreiving and managing information about movies. I have built while reading the [Let's Go Further](https://lets-go-further.alexedwards.net/).

## Prerequisites

* Go (v1.21)
* PostgreSQL
* golang-migrate

## Project structure

```
.
├── bin
│   └── linux_amd64
├── cmd
│   ├── api
│   └── examples
│       └── cors
│           ├── preflight
│           └── simple
├── internal
│   ├── data
│   ├── mailer
│   │   └── templates
│   ├── validator
│   └── vcs
├── migrations
├── remote
│   ├── production
│   └── setup
└── vendor
    ├── github.com
    ├── golang.org
    └── gopkg.in
```

## Configuration

* Add the GREENLIGHT_DB_DSN environment variable to the file .envrc file:

```
export GREENLIGHT_DB_DSN='postgres://greenlight:password@localhost/greenlight'
```

## Features

### Makefile

```
$ make
Usage:
  help                       print this help message
  run/api                    run the cmd/api application
  db/psql                    connect to the database using psql
  db/migration/new name=$1   create a new database migration
  db/migration/down          apply all up database migrations
  audit                      tidy and vendor dependencies and format, vet and test all code
  vendor                     tidy and vendor dependencies
  build/api                  build the cmd/api application
  production/connect         connect to the production server
  production/deploy/api      deploy the api to production
```

### Command line parameters

```
$ ./bin/api --help
Usage of ./bin/api:
  -cors-trusted-origins value
        Trusted CORS origins (space separated)
  -db-dsn string
        PostgreSQL DSN
  -db-max-idle-conns int
        PostgreSQL max idle connections (default 25)
  -db-max-idle-time duration
        PostgreSQL max connection idle time (default 1m0s)
  -db-max-open-conns int
        PostgreSQL max open connections (default 25)
  -env string
        Environment (development|staging|production) (default "development")
  -limiter-burst int
        Rate limiter maximum burst (default 4)
  -limiter-enabled
        Rate limiter enabled
  -limiter-rps float
        Rate limiter maximum requests per second (default 2)
  -port int
        API server port (default 4000)
  -smtp-host string
        SMTP host (default "sandbox.smtp.mailtrap.io")
  -smtp-password string
        SMTP password (default "fa91bbd02c005c")
  -smtp-port int
        SMTP port (default 2525)
  -smtp-sender string
        SMTP sender (default "Greenlight <no-reply@greenlight.org>")
  -smtp-username string
        SMTP username (default "73b9c2eb4e5a64")
  -version
        Display version and exit
```

### API Routes

API Endpoints and RESTful Routing:

| Method | URL Pattern      | Handler               | Action                                |
|--------|------------------|-----------------------|---------------------------------------|
| GET    | /v1/healthcheck  | healthcheckHandler    | Show application information          |
| GET    | /v1/movies       | listMovieHandler      | Show the details of all movies        |
| POST   | /v1/movies       | createMovieHandler    | Create a new movie                    |
| GET    | /v1/movies/:id   | showMovieHandler      | Show the details of a specific movie  |
| PUT    | /v1/movies/:id   | editMovieHandler      | Update the details of a specific movie |
| DELETE | /v1/movies/:id   | deleteMovieHandler    | Delete a specific movie               |
| POST   | /v1/users        | registerUserHandler   | Register a new user                   |
| PUT    | /v1/users/activated | activatedUserHandler | Activate a specific user            |
| POST   | /v1/tokens/authentication | createAuthenticationTokenHandler | Generate a new authentication token |
| GET    | /debug/vars      | expvar.Handler()      | Display application metrics           |
| POST   | /v1/tokens/password-reset | createPasswordResetTokenHanlder | Generate a new password reset token |
| PUT    | /v1/users/password | updateUserPasswordHandler | Update the password for a specific user |
| POST   | /v1/tokens/activation    | createActivationTokenHandler | Generate a new activation token |

### General

* Command-line flags
* Using Makefiles
* Vendoring
* Building and optimizing binaries
* Cross-compilation
* Automating Version Numbers
* Sending Emails
* Emails HTML templates

### API

* REST API
* HTTP Router
* JSON Responses
* JSON Encoding
* Formatting and Enveloping Responses
* CRUD Operations
* Partial Updates
* Filtering, sorting and pagination
* Full-Text Search
* User Registration
* User Activation
* Middleware
* Metrics

### Logging & Errors

* Managing Error Messages
* Panic Recovery
* Managing Bad Requests

### Database

* DB Connection Pool
* Limiting the Connection Pool
* SQL Migrations
* SQL Query Timeouts

### Security

* Restricting Inputs
* Input Validation
* IP-based Rate Limiting
* Grateful Shutdown
* Secure Activation Tokens
* Stateful Authentication Token
* Cross Origin Requests
* Permission-based Authorization
* Preflight CORS Requests
* Quality Controlling Code
* Data Race Prevention