defmodule Adminhunter.Repo.Migrations.UserAddName do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string
    end
  end
end
