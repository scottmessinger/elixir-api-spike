use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :common_standards_project, CommonStandardsProject.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :common_standards_project, CommonStandardsProject.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "common_standards_project_test",
  pool: Ecto.Adapters.SQL.Sandbox, # Use a sandbox for transactional testing
  size: 1
