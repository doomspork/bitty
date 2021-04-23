defmodule Tiny.Urls do
  @moduledoc """
  """

  alias Tiny.Schemas.Url
  alias Tiny.Repo

  @doc """
  Persist a given URL and return the new record including unique slug
  """
  @spec create(map()) :: {:ok, Url.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    params
    |> Url.changeset()
    |> Repo.insert()
  end

  @doc """
  Retrieve a URL given the slug
  """
  @spec get(String.t()) :: Url.t() | nil
  def get(slug) do
    Repo.get_by(Url, slug: String.downcase(slug))
  end
end
