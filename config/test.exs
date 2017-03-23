use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chs, Chs.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :chs, Chs.Repo,
     adapter: Ecto.Adapters.Postgres,
     database: System.get_env("POSTGRES_DB")       || "chs_test",
     username: System.get_env("POSTGRES_USER")     || "postgres",
     password: System.get_env("POSTGRES_PASSWORD") || "postgres",
     hostname: System.get_env("DB_HOST")           || "localhost",
     pool: Ecto.Adapters.SQL.Sandbox
