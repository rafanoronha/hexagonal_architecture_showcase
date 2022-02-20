import Config

alias Showcase.{
  PrimaryAdapters.HttpEndpoint,
}

config :showcase, HttpEndpoint,
  url: [host: "localhost"]
