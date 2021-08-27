defmodule Scraper.MixProject do
  use Mix.Project

  @github_url "https://github.com/jhonisds/scraper.git"

  def project do
    [
      app: :scraper,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      name: "Scraper",
      description: "Elixir project scraper",
      homepage_url: @github_url,
      source_url: @github_url,
      files: ~w(mix.exs lib LICENSE.md README.md CHANGELOG.md),
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"]
      ],
      package: [
        maintainers: ["Jhoni Santos"],
        licences: ["MIT"],
        links: %{"GitHub" => @github_url}
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.json": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:floki, "~> 0.31.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.23.0"},
      {:excoveralls, "~> 0.13.4", only: :test}
    ]
  end

  defp aliases do
    [
      quality: ["format", "credo --strict"]
    ]
  end
end
