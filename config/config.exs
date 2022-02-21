import Config

alias Showcase.{
  PrimaryAdapters.HttpEndpoint,
  SecondaryAdapters.DatabaseRepo,
}

config :showcase, HttpEndpoint,
  url: [host: "localhost"]

config :showcase,
  ecto_repos: [DatabaseRepo]

config :postgrex,
  :json_library, Jason
