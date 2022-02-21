defmodule Showcase.Glue.EctoChangesetEncoding do
  def encode_invalid_changeset_errors!(%Ecto.Changeset{valid?: false, errors: errors}) do
    error_list = for result_error <- errors  do
      {field_name, ecto_error}= result_error
      {_error_message, ecto_validation} = ecto_error
      [ecto_validation_message | _ecto_validation_tail] = ecto_validation
      ecto_validation_message= Kernel.inspect ecto_validation_message
      %{error: "invalid field value", field: %{field_name: field_name, error_message: ecto_validation_message }}
    end
    Poison.encode!(%{errors: error_list})
  end
end
