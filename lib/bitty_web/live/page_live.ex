defmodule BittyWeb.PageLive do
  @moduledoc false
  use BittyWeb, :live_view

  alias Bitty.Urls

  @impl true
  def mount(_params, _session, socket) do
    changeset = Urls.create_url_changeset()
    {:ok, assign(socket, changeset: changeset, short_url: nil)}
  end

  @impl true
  def handle_event("save", %{"url" => params}, socket) do
    changeset = Urls.create_url_changeset(params)

    assigns =
      with true <- changeset.valid?,
           {:ok, %{slug: slug}} <- Urls.create(params) do
        short_url = Routes.redirect_url(socket, :external, slug)
        [changeset: changeset, short_url: short_url]
      else
        {:error, changeset} -> [changeset: changeset]
        false -> [changeset: changeset]
      end

    {:noreply, assign(socket, assigns)}
  end
end
