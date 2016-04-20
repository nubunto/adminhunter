defmodule Adminhunter.Repo.Migrations.UserAddTypeId do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :type_id, references(:types)
    end
  end
end
