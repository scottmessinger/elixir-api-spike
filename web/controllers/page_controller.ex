defmodule CommonStandardsProject.PageController do
  use CommonStandardsProject.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
