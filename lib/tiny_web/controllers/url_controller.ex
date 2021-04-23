defmodule TinyWeb.UrlController do
  use TinyWeb, :controller

  alias Tiny.Urls

  action_fallback TinyWeb.FallbackController

  def create(conn, params) do
    with {:ok, url} <- Urls.create(params) do
      conn
      |> put_status(201)
      |> render("show.json", url: url)
    end
  end

  def show(conn, %{"slug" => slug}) do
    with %{} = url <- Urls.get(slug) do
      render(conn, "show.json", url: url)
    end
  end
end
