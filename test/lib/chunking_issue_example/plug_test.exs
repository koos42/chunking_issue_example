defmodule ChunkingIssueExample.PlugTest do
  use ExUnit.Case
  use Plug.Test

  @opts ChunkingIssueExample.Plug.init([])

  doctest ChunkingIssueExample.Plug

  test "sending a chunked response works and it matches CURL" do
    conn = conn(:get, "/")
    conn = ChunkingIssueExample.Plug.call(conn, @opts)
    {curl_resp_body, 0} = IO.inspect System.cmd("curl", ["-s", "localhost:4000"])

    assert conn.state == :chunked
    assert conn.status == 200
    assert conn.resp_body == "hello\nworld\ngoodbye\n"

    assert conn.resp_body == curl_resp_body
  end
end
