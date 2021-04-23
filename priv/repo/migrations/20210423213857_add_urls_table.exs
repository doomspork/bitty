defmodule Tiny.Repo.Migrations.AddUrlsTable do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string, null: false
      add :slug, :string, null: false

      timestamps(updated_at: false)
    end

    create unique_index(:urls, :slug)
  end
end
