defmodule Adminhunter.Repo.Migrations.TypeUserSettle do
  use Ecto.Migration

  def change do
    alter table(:types) do
      remove :user_id
    end
  end
end
