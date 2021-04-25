defmodule BittyWeb.FallbackController do
  @moduledoc """
  Could we do without this and move the logic into the UrlController? Absolutely.

  This is a personal choice because I like keeping my controllers clean and
  focused on the positive case.
  """
  use BittyWeb, :controller

  alias BittyWeb.ErrorView

  @doc """
  This occurs when `Urls.get/1` is used with slug that does not exist
  """
  def call(conn, {:error, %Ecto.Changeset{errors: errors}}) do
    {error, _meta} = Keyword.get(errors, :url)

    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("error.json", error: "url #{error}")
  end

  @doc """
  This occurs when `Urls.get/1` is used with slug that does not exist
  """
  def call(conn, nil) do
    conn
    |> put_status(404)
    |> put_view(ErrorView)
    |> render("error.json", error: "this is not the url you're looking for.")
  end
end
