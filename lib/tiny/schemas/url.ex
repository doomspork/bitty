defmodule Tiny.Schemas.Url do
  @moduledoc """
  Schema representing a URL in our system
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Tiny.Repo
  alias __MODULE__, as: Url

  schema "urls" do
    field :slug, :string
    field :url, :string

    timestamps(updated_at: false)
  end

  def changeset(attrs) do
    %Url{}
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/^https?/)
    |> generate_unsafe_unqiue_slug()
    |> unique_constraint(:slug)
  end

  defp generate_slug do
    6
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, 6)
  end

  defp generate_unsafe_unqiue_slug(changeset) do
    slug = generate_slug()

    case Repo.get_by(Url, slug: slug) do
      %Url{} -> generate_unsafe_unqiue_slug(changeset)
      nil -> put_change(changeset, :slug, slug)
    end
  end
end
