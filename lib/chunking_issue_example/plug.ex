defmodule ChunkingIssueExample.Plug do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn = put_resp_content_type(conn, "text/plain")
    conn = send_chunked(conn, 200)
    {:ok, %Plug.Conn{state: :chunked} = conn} = chunk(conn, "hello\n")
    {:ok, %Plug.Conn{state: :chunked} = conn} = chunk(conn, "world\n")
    {:ok, %Plug.Conn{state: :chunked} = conn} = chunk(conn, "")
    {:ok, %Plug.Conn{state: :chunked} = conn} = chunk(conn, "goodbye\n")
    conn
  end
end
