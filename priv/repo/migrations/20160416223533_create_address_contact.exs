defmodule Adminhunter.Repo.Migrations.CreateAddressContact do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :address, :map
      add :contact, :map
    end
  end
end
