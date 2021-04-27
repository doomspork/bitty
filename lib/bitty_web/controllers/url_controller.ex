defmodule BittyWeb.UrlController do
  use BittyWeb, :controller

  alias Bitty.Urls

  action_fallback BittyWeb.FallbackController

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, params) do
    with {:ok, url} <- Urls.create(params) do
      conn
      |> put_status(201)
      |> render("show.json", url: url)
    end
  end

  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"slug" => slug}) do
    with %{} = url <- Urls.get(slug) do
      render(conn, "show.json", url: url)
    end
  end
end
