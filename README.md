# greenlight

API Endpoints and RESTful Routing:

| Method | URL Pattern      | Handler               | Action                                |
|--------|------------------|-----------------------|---------------------------------------|
| GET    | /v1/healthcheck  | healthcheckHandler    | Show application information          |
| GET    | /v1/movies       | listMovieHandler      | Show the details of all movies        |
| POST   | /v1/movies       | createMovieHandler    | Create a new movie                    |
| GET    | /v1/movies/:id   | showMovieHandler      | Show the details of a specific movie  |
| PUT    | /v1/movies/:id   | editMovieHandler      | Update the details of a specific movie |
| DELETE | /v1/movies/:id   | deleteMovieHandler    | Delete a specific movie               |