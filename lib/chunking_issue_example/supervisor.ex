defmodule ChunkingIssueExample.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
    Plug.Adapters.Cowboy.http ChunkingIssueExample.Plug, []
  end

  def init(:ok) do
    children = []
    supervise(children, strategy: :one_for_one)
  end
end
