
# Bitty

> The IttyBitty URL shortener.

The Bitty in [Itty](https://github.com/doomspork/itty)Bitty.

## Local Development

### Starting our database

Within our repository can be found `docker-compose.yml` that defines our external dependencies, at this time just a Postgres database. Thanks to Docker and Docker Compose to get things started for local development and test we just need to run:

```shell
$ docker-compose up
```

Note: `down` can be used to shut things down gracefully when work is done

### Fetching our dependencies

This example is built using Elixir and Phoenix and kept pretty standard. As a result, those with even limited exposure should find these steps familiar.

```shell
$ mix deps.get
$ mix compile
```

### Setting up our database

Now that we've fetched our dependencies and compiled our project, we can leverage our Mix tasks to do the hard work for us; included with Phoenix is a useful alias we can use here:

```shell
$ mix ecto.setup
```

At any point if we need to bring our database back to square one we can leverage the similarly useful `ecto.reset`:

```shell
$ mix ecto.reset
```

### Adding features

Step 1. Write great code.
Step 2. Write great tests.
Step 3. Print money.

### Testing our code

Once you've developed your money printing features and ensured adequate test coverage, we need to run those tests:

```elixir
$ mix test
```

### Keeping things clean

We like our code to be clean. We can make use of 2 popular methods in the Elixir ecosystem: formatter and Credo. This project makes use of both.

The formatter will take care of adjusting any small style changes necessary to maintain compliance with our styleguide.

Credo applies another best practice and styleguide rules to us, helping prevent complexity and other pitfalls.

It's always a good practice to run both before committing and pushing your code:

```elixir
$ mix format
$ mix credo
```

With tests passing, code formatted, and Credo happy it's time to commit!

## Deployments

Docker and Heroku's container stack were used to deploy this. The deployment target could be updated to elsewhere easy enough.

## Continous Integration & Delivery

GitHub Actions.
