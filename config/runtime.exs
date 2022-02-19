import Config

alias Showcase.SecondaryAdapters.DatabaseRepo

config :showcase, DatabaseRepo,
  url: System.get_env(
    "DB_CONN_STRING",
    "ecto://showcase:showcase@localhost:25432/showcase"
  )
