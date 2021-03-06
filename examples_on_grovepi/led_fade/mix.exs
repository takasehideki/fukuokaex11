defmodule LEDFade.Mixfile do
  use Mix.Project

  def project do
    [app: :led_fade,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {LEDFade.Application, []}]
  end

  defp deps do
    [{:grovepi, github: "adkron/grovepi", branch: "master"}]
  end
end
