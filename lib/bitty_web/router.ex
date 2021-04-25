defmodule BittyWeb.Router do
  use BittyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BittyWeb do
    pipe_through :api

    post "/urls", UrlController, :create
    get "/urls/:slug", UrlController, :show
  end
end
