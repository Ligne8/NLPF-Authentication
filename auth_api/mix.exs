defmodule AuthApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :auth_api,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7.14"},
      {:mongodb_driver, "~> 1.0.0"},
      {:jason, "~> 1.2"}
    ]
  end
end
