defmodule Tiny.Factory do
  @moduledoc """
  Home to our ExMachina factories
  """
  use ExMachina.Ecto, repo: Tiny.Repo

  alias Tiny.Schemas.Url

  def url_factory do
    %Url{
      url: sequence(:url, &"https://example.com/#{&1}"),
      slug: sequence(:slug, &"uniqueslug#{&1}")
    }
  end
end
