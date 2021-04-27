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

  @spec changeset(map(), boolean()) :: Ecto.Changeset.t()
  def changeset(attrs, generate_slug \\ true) do
    %Url{}
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/^(https?:\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$/i,
      message: "Only HTTP/HTTPS URLs are supported at this time."
    )
    |> generate_unsafe_unqiue_slug(generate_slug)
    |> unique_constraint(:slug)
  end

  defp generate_slug do
    for _x <- 0..8, do: Enum.random(@tokens), into: ""
  end

  defp generate_unsafe_unqiue_slug(changeset, generate_slug \\ true)

  defp generate_unsafe_unqiue_slug(changeset, false) do
    changeset
  end

  defp generate_unsafe_unqiue_slug(changeset, _) do
    slug = generate_slug()

    case Repo.get_by(Url, slug: slug) do
      %Url{} -> generate_unsafe_unqiue_slug(changeset)
      nil -> put_change(changeset, :slug, slug)
    end
  end
end
