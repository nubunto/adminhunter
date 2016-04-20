defmodule Adminhunter.Repo.Migrations.ClientsAddAddressContact do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :address, :map
      add :contact, :map
    end
  end
end
