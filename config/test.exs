use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hipsterska_strona, HipsterskaStrona.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hipsterska_strona, HipsterskaStrona.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "hipsterska_strona_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
