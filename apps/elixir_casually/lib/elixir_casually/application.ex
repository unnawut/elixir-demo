defmodule ElixirCasually.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {ElixirCasually.VoterRegistry, name: ElixirCasually.VoterRegistry},
      {ElixirCasually.VoteCountRegistry, name: ElixirCasually.VoteCountRegistry},
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ElixirCasually.Supervisor)
  end
end
