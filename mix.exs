defmodule Showcase.MixProject do
  use Mix.Project

  def project do
    [
      app: :showcase,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Showcase.Glue.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.13"},
      {:cowboy, "~> 2.9"},
      {:plug_cowboy, "~> 2.5"},
      {:poison, "~> 5.0"},
      {:jason, "~> 1.3"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, "~> 0.15"},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create -r Showcase.SecondaryAdapters.DatabaseRepo", "ecto.migrate -r Showcase.SecondaryAdapters.DatabaseRepo"],
      "ecto.reset": ["ecto.drop -r Showcase.SecondaryAdapters.DatabaseRepo", "ecto.setup"],
    ]
  end
end
