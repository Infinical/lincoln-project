defmodule LincolnProjectWeb.AdminController do
  use LincolnProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", layout: {LincolnProjectWeb.LayoutView, "admin.html"})
  end
end
