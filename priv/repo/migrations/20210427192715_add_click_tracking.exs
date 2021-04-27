defmodule Bitty.Repo.Migrations.AddClickTracking do
  use Ecto.Migration

  def change do
    create table(:clicks) do
      add :url_id, references(:urls), null: false
      add :ip, :string
      add :user_agent, :string

      timestamps(updated_at: false)
    end
  end
end
