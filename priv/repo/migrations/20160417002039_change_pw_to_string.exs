defmodule Adminhunter.Repo.Migrations.ChangePwToString do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :encrypted_password, :string
    end
  end
end
