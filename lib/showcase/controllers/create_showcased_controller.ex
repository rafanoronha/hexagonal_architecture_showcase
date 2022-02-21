defmodule Showcase.Controllers.CreateShowcasedController do

  alias Showcase.{
    Showcased,
    SecondaryAdapters.DatabaseRepo,
  }

  def create_showcased(%Ecto.Changeset{data: %Showcased{}, valid?: true} = changeset) do
    DatabaseRepo.insert(changeset)
  end
  def create_showcased(%Ecto.Changeset{data: %Showcased{}, valid?: false, errors: _errors} = changeset) do
    {:error, :invalid_changeset, changeset}
  end
end
