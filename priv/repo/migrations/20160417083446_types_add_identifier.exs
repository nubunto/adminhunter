defmodule Adminhunter.Repo.Migrations.TypesAddIdentifier do
  use Ecto.Migration

  def change do
    alter table(:types) do
      add :type_identifier, :string
    end
  end
end
