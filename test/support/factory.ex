defmodule Bitty.Factory do
  @moduledoc """
  Home to our ExMachina factories
  """
  use ExMachina.Ecto, repo: Bitty.Repo

  alias Bitty.Schemas.Url

  def url_factory do
    %Url{
      url: sequence(:url, &"https://example.com/#{&1}"),
      slug: sequence(:slug, &"uniqueslug#{&1}")
    }
  end
end
