defmodule Chattideo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chattideo.Repo,
      # Start the Telemetry supervisor
      ChattideoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chattideo.PubSub},
      # Start the Endpoint (http/https)
      ChattideoWeb.Endpoint
      # Start a worker by calling: Chattideo.Worker.start_link(arg)
      # {Chattideo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chattideo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChattideoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
