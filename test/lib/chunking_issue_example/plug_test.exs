defmodule ChunkingIssueExample.PlugTest do
  use ExUnit.Case
  use Plug.Test

  @opts ChunkingIssueExample.Plug.init([])

  doctest ChunkingIssueExample.Plug

  test "sending a chunked response works" do
    conn = conn(:get, "/")
    conn = ChunkingIssueExample.Plug.call(conn, @opts)

    assert conn.state == :chunked
    assert conn.status == 200
    assert conn.resp_body == "hello\nworld\ngoodbye\n"
  end
end
