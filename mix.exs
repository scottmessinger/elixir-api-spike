defmodule CommonStandardsProject.Mixfile do
  use Mix.Project

  def project do
    [app: :common_standards_project,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {CommonStandardsProject, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :mongodb_ecto, :mongodb, :postgrex]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.14"},
     {:ecto, nil, [git: "git://github.com/elixir-lang/ecto.git", override: true]},
     {:phoenix_ecto, "~> 0.5"},
     {:mongodb_ecto, github: "michalmuskala/mongodb_ecto"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 1.1"},
     {:phoenix_live_reload, "~> 0.4", only: :dev},
     {:cowboy, "~> 1.0"}]
  end
end
