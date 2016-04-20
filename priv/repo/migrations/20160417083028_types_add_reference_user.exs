defmodule Adminhunter.Repo.Migrations.TypesAddReferenceUser do
  use Ecto.Migration

  def change do
    drop table(:type)

    create table(:types) do
      add :name, :string
      add :limit, :integer

      timestamps
    end

    alter table(:types) do
      add :user_id, references(:users)
    end
    
    alter table(:users) do
      add :type_id, :integer
    end
  end
end
