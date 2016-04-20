defmodule Adminhunter.Repo.Migrations.TypeAddUserId do
  use Ecto.Migration

  def change do
    alter table(:types) do
      add :user_id, references(:users)
    end
  end
end
