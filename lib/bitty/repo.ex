defmodule Bitty.Repo do
  use Ecto.Repo,
    otp_app: :bitty,
    adapter: Ecto.Adapters.Postgres
end
