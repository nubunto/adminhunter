alias Adminhunter.User
alias Adminhunter.Repo

address = %{address: "Rua X", number: 139, neighborhood: "Vl. Aurocan", city: "Campinas", postal_code: "13034-170"}
contact = %{name: "Someone", cell_phone: "19 9413 4313"}
user = User.changeset(%User{}, %{email: "Foo@Bar", encrypted_password: :crypto.hash(:sha256, "123456"), address: address, contact: contact})
Repo.insert!(user)
