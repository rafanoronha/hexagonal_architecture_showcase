defmodule Showcase.ShowcasedTest do
  use Showcase.ChangesetCase

  alias Showcase.Showcased

  describe "Showcase.create_changeset/2" do
    @valid_attrs %{
      name: "Hexagonal Architecture",
      description: """
        Allow an application to equally be driven by users,
        programs, automated test or batch scripts,
        and to be developed and tested in isolation
        from its eventual run-time devices and databases.
        """,
      context: %{
        added_by: "rafanoronha"
      }
    }

    test "valid create_changeset" do
      changeset = Showcased.create_changeset(%Showcased{}, @valid_attrs)
      assert changeset.valid?
    end

    test "missing name" do
      changeset = Showcased.create_changeset(%Showcased{}, %{@valid_attrs | name: nil})
      assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "missing description" do
      changeset = Showcased.create_changeset(%Showcased{}, %{@valid_attrs | description: nil})
      assert %{description: ["can't be blank"]} = errors_on(changeset)
    end

    test "missing context" do
      changeset = Showcased.create_changeset(%Showcased{}, %{@valid_attrs | context: nil})
      assert %{context: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
