# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apex,
  ecto_repos: [Apex.Repo]

config :apex, Apex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :apex, ApexWeb.Auth.Guardian,
  issuer: "apex",
  secret_key: "QTQsZQjaCvEkUw9Ugzydj7JaS33z97h52DWH106QFhdaCURDWMINcGeHOwIpkgAu"

config :apex, ApexWeb.Auth.Pipeline,
  module: ApexWeb.Auth.Guardian,
  error_handler: ApexWeb.Auth.ErrorHandler

# Configures the endpoint
config :apex, ApexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IZ7u2WCR5kMBbeKb21JJBN0ySA5xWTmPtZ2fVNj/jvuh7mJy7+Fi0jWIpdmmNHkh",
  render_errors: [view: ApexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Apex.PubSub,
  live_view: [signing_salt: "xoUb7gpp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
