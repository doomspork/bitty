defmodule Bitty.Schemas.Click do
  @moduledoc """
  Schema representing a Click of a URL
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Bitty.Schemas.Url
  alias __MODULE__, as: Click

  @type t :: %Click{
          ip_address: :string,
          user_agent: :string,
          url: Url.t()
        }

  schema "clicks" do
    field :ip_address, :string
    field :user_agent, :string

    belongs_to :url, Url

    timestamps(updated_at: false)
  end

  @spec changeset(map()) :: Ecto.Changeset.t()
  def changeset(attrs) do
    %Click{}
    |> cast(attrs, [:ip_address, :user_agent, :url_id])
    |> validate_required([:ip_address, :user_agent, :url_id])
    |> assoc_constraint(:url)
  end
end
