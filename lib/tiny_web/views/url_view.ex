defmodule TinyWeb.UrlView do
  use TinyWeb, :view

  @doc """
  Return a _very_ simple JSON object

  We could do something more like %{id: ..., type: ..., attributes: { ...}} like
  we find in JSON:API but that feels like a lot for this project
  """
  def render("show.json", %{url: url}) do
    %{slug: url.slug, url: url.url}
  end
end
