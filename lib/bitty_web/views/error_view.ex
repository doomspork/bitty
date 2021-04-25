defmodule BittyWeb.ErrorView do
  use BittyWeb, :view

  @doc """
  See comment in BittyWeb.UrlView RE: simplicity.
  """
  def render("error.json", %{error: error}) do
    %{errors: %{detail: error}}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
