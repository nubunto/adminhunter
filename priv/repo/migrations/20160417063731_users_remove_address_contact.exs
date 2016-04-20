defmodule Adminhunter.Repo.Migrations.UsersRemoveAddressContact do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :address
      remove :contact
    end
  end
end
