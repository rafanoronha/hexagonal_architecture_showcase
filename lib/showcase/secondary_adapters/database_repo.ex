defmodule Showcase.SecondaryAdapters.DatabaseRepo do
  use Ecto.Repo,
    otp_app: :showcase,
    adapter: Ecto.Adapters.Postgres
end
