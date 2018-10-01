# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cat_caffe,
  ecto_repos: [CatCaffe.Repo]

# Configures the endpoint
config :cat_caffe, CatCaffeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LeMsaw3kp+udjEhGBFk0Tf5vLWiQkkSx5z4IsUgUgYEUGv3qAq5GmQ02QGISTXvb",
  render_errors: [view: CatCaffeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CatCaffe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
