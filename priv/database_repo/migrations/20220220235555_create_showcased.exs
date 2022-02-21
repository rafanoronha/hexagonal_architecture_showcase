defmodule Showcase.SecondaryAdapters.DatabaseRepo.Migrations.CreateShowcased do
  use Ecto.Migration

  def change do
    create table(:showcased) do
      timestamps()
      add :name, :string, [size: 100, null: false]
      add :description, :string, [size: 280, null: false]
      add :context, :map, [null: false]
    end
  end
end
