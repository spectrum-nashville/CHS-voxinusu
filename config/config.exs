# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chs,
  ecto_repos: [Chs.Repo]

# Configures the endpoint
config :chs, Chs.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7JysDQ+wiwOJiNUH5D+uSAkSyy9/0L7+XvUsKDBcjzDQNVAA23Y6wPZl4iGzZfv3",
  render_errors: [view: Chs.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chs.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configure providers for ueberauth
config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [ opt1: "chs", opts2: "fb" ] },
    github: { Ueberauth.Strategy.Github, [ opt1: "chs", opts2: "git" ] }
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure bamboo and bamboo smtp
config :chs, Chs.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.domain",
  port: 1025,
  username: "your.name@your.domain",
  password: "pa55word",
  tls: :if_available, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
