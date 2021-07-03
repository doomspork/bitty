defmodule BittyWeb.RedirectController do
  use BittyWeb, :controller

  alias Bitty.Urls

  def external(conn, %{"slug" => slug}) do
    case Urls.get(slug) do
      %{url: url} ->
        redirect(conn, external: url)

      nil ->
        conn
        |> put_flash(:error, "The URL you're looking for appears to be missing.")
        |> redirect(to: "/")
    end
  end
end
