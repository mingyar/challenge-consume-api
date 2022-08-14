defmodule Apex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Apex.Repo,
      # Start the Telemetry supervisor
      ApexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Apex.PubSub},
      # Start the Endpoint (http/https)
      ApexWeb.Endpoint
      # Start a worker by calling: Apex.Worker.start_link(arg)
      # {Apex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Apex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ApexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
