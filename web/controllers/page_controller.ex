defmodule HipsterskaStrona.PageController do
  use HipsterskaStrona.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def coffe(conn, _params) do
  	render conn, "coffe.html"
  end
end
