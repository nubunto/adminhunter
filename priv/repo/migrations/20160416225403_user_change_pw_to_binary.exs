defmodule Adminhunter.Repo.Migrations.UserChangePwToBinary do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :encrypted_password
      add :encrypted_password, :binary
    end
  end
end
