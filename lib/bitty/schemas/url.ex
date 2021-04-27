defmodule Bitty.Schemas.Url do
  @moduledoc """
  Schema representing a URL in our system
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Bitty.Repo
  alias __MODULE__, as: Url

  @tokens String.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", "")

  @type t :: %Url{
          slug: String.t(),
          url: String.t()
        }

  schema "urls" do
    field :slug, :string
    field :url, :string

    timestamps(updated_at: false)
  end

  @spec changeset(map()) :: Ecto.Changeset.t()
  def changeset(attrs) do
    %Url{}
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/^https?/)
    |> generate_unsafe_unqiue_slug()
    |> unique_constraint(:slug)
  end

  defp generate_slug do
    for _x <- 0..8, do: Enum.random(@tokens), into: ""
  end

  defp generate_unsafe_unqiue_slug(changeset) do
    slug = generate_slug()

    case Repo.get_by(Url, slug: slug) do
      %Url{} -> generate_unsafe_unqiue_slug(changeset)
      nil -> put_change(changeset, :slug, slug)
    end
  end
end
