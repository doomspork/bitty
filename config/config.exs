# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bitty,
  ecto_repos: [Bitty.Repo]

# Configures the endpoint
config :bitty, BittyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aB8CU8KjjenKXueB9JwL0Zy6ePPCKygNCwH2V30y7lU/EGfTq5ZSU1aMcO9J8P/6",
  render_errors: [view: BittyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bitty.PubSub,
  live_view: [signing_salt: "2hXyByqs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
