defmodule Adminhunter.Repo.Migrations.UserRemoveTypeId do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :type_id
    end
  end
end
