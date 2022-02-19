defmodule Showcase.Showcased do
  use Ecto.Schema
  import Ecto.Changeset

  schema "showcased" do
    field :name, :string
    field :description, :string
    field :context, :map
  end

  def create_changeset(showcased, params \\ %{}) do
    showcased
    |> cast(params, [
      :name,
      :description,
      :context,
    ])
    |> validate_required([
      :name,
      :description,
      :context,
    ])
  end
end
