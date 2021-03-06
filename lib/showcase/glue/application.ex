defmodule Showcase.Glue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Showcase.{
    PrimaryAdapters.HttpEndpoint,
    SecondaryAdapters.DatabaseRepo,
  }

  @impl true
  def start(_type, _args) do
    children = [
      HttpEndpoint,
      DatabaseRepo,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Showcase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
