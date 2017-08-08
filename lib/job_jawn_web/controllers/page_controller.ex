defmodule JobJawnWeb.PageController do
  use JobJawnWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
