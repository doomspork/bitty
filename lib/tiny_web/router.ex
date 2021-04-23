defmodule TinyWeb.Router do
  use TinyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TinyWeb do
    pipe_through :api

    post "/urls", UrlController, :create
    get "/urls/:slug", UrlController, :show
  end
end
