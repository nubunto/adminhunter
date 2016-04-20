# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Adminhunter.Repo.insert!(%Adminhunter.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Adminhunter.{Repo, Type}


adm = Repo.insert!(%Type{name: "Administrador", type_identifier: "admin", limit: 1})
Repo.insert!(%Type{name: "Criação", type_identifier: "creation", limit: 4})
Repo.insert!(%Type{name: "Vendas", type_identifier: "sales", limit: 2})
Repo.insert!(%Type{name: "Financeiro", type_identifier: "finance", limit: 2})

password = :crypto.hash(:sha256, "admin")
password = password |> Base.encode16 |> String.downcase
user = Ecto.build_assoc(adm, :users, name: "Admin", encrypted_password: password)
IO.inspect(user)
Repo.insert!(user)
