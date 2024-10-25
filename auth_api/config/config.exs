# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :auth_api,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :auth_api, AuthApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: AuthApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: AuthApi.PubSub,
  live_view: [signing_salt: "kXSuDbup"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure the database
config :auth_api, AuthApi.Mongo,
  url: "mongodb://ligne8:ligne8password@localhost:27017/auth"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
