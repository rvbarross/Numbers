defmodule NumbersWeb.PageController do
  use NumbersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
