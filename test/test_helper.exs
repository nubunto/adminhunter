ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Adminhunter.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Adminhunter.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Adminhunter.Repo)

