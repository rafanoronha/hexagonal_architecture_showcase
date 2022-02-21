defmodule Showcase.PrimaryAdapters.HttpEndpoint do
  use Plug.Router

  alias Showcase.{
    Showcased,
  }

  import Showcase.{
    Controllers.CreateShowcasedController,
    Glue.EctoChangesetEncoding,
  }

  require Logger

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison

  plug(:match)

  plug(:dispatch)

  post "/showcased" do
    changeset = Showcased.create_changeset(%Showcased{}, conn.body_params)
    case create_showcased(changeset) do
      {:ok, _} ->
        send_resp(conn, 201, "")
      {:error, :invalid_changeset, invalid_changeset} ->
        send_resp(conn, 400, encode_invalid_changeset_errors!(invalid_changeset))
      result ->
        Logger.error("internal server error: #{result |> inspect}")
        send_resp(conn, 500, "Internal Server Error")
    end
  end

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
