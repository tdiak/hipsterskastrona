# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hipsterska_strona,
  ecto_repos: [HipsterskaStrona.Repo]

# Configures the endpoint
config :hipsterska_strona, HipsterskaStrona.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eOcBo2D7K6XHiGlsGqMPb2JRYARlZGqkyX00Hu0OKxZMAZHykkYlJqYNHBrZdwu5",
  render_errors: [view: HipsterskaStrona.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HipsterskaStrona.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :ex_admin,
  repo: HipsterskaStrona.Repo,
  module: HipsterskaStrona,
  modules: [
    HipsterskaStrona.ExAdmin.Dashboard,
    HipsterskaStrona.ExAdmin.Post,
    HipsterskaStrona.ExAdmin.User,
    HipsterskaStrona.ExAdmin.CoffeItem
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}


# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: HipsterskaStrona.User,
  repo: HipsterskaStrona.Repo,
  module: HipsterskaStrona,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, HipsterskaStrona.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here",
  opts: [:authenticatable, registerable: []]
# %% End Coherence Configuration %%
