# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :job_jawn,
  ecto_repos: [JobJawn.Repo]

# Configures the endpoint
config :job_jawn, JobJawnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GuDgUwDafrdt2JjQgg7RpiAXjc1+kxI91kPpyqQpn/Z9RMRGhwabaybO5i7+pn0Z",
  render_errors: [view: JobJawnWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JobJawn.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
