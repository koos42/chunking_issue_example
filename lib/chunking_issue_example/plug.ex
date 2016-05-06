defmodule ChunkingIssueExample.Plug do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn = put_resp_content_type(conn, "text/plain")
    conn = send_chunked(conn, 200)
    {:ok, conn} = chunk(conn, "hello\n")
    {:ok, conn} = chunk(conn, "world\n")
    {:ok, conn} = chunk(conn, "")
    {:ok, conn} = chunk(conn, "goodbye\n")
    conn
  end
end
