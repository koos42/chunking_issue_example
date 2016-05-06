defmodule ChunkingIssueExample do
  use Application

  def start(_, _) do
    ChunkingIssueExample.Supervisor.start_link
  end
end
