defmodule Bitty.Urls do
  @moduledoc """
  Encapsulates our database interactions and business logic for URLs
  """

  alias Bitty.Schemas.Url
  alias Bitty.Repo

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
  Allows our LiveView to create a changeset for its `form_for` tag
  """
  @spec create_url_changeset(map()) :: Ecto.Changeset.t()
  def create_url_changeset(params \\ %{}) do
    Url.changeset(params, false)
  end

  @doc """
  Retrieve a URL given the slug
  """
  @spec get(String.t()) :: Url.t() | nil
  def get(slug) do
    Repo.get_by(Url, slug: slug)
  end
end
