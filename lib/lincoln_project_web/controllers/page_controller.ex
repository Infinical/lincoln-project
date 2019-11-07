defmodule LincolnProjectWeb.PageController do
  use LincolnProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
