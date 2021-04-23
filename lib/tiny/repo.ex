defmodule Tiny.Repo do
  use Ecto.Repo,
    otp_app: :tiny,
    adapter: Ecto.Adapters.Postgres
end
