# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :common_standards_project, CommonStandardsProject.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "or8lW75ORIrRhMbv6LF6pcia7zQxTdR3duYQ4QTvs2jOU3Yhm/fTXSy9r5wC1f3+",
  render_errors: [default_format: "html"],
  pubsub: [name: CommonStandardsProject.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configure the db
 config :simple, CommonStandardsProject.Repo,
   adapter: Mongo.Ecto,
   database: "common-standards-project",
   hostname: "localhost:27017"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
