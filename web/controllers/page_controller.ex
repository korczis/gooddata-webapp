defmodule Webapp.PageController do
  use Webapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def proxy(conn, _params) do
    render conn, "index.html"
  end
end
