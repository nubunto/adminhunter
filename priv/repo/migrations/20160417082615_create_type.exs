defmodule Adminhunter.Repo.Migrations.CreateType do
  use Ecto.Migration

  def change do
    create table(:type) do
      add :name, :string
      add :limit, :integer

      timestamps
    end

  end
end
