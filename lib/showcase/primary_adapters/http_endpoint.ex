defmodule Showcase.PrimaryAdapters.HttpEndpoint do
  use Plug.Router

plug(:match)

  plug(:dispatch)

  match "/health" do
    send_resp(conn, 200, "Healthy")
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts),
    do: Plug.Cowboy.http(__MODULE__, [], port: (System.get_env("PORT") || "14001") |> String.to_integer)
end
