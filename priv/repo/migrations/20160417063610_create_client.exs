defmodule Adminhunter.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :type, :string
      add :social_reason, :string
      add :cpf, :string
      add :cnpj, :string
      add :observation, :string

      timestamps
    end

  end
end
