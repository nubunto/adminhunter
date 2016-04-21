defmodule Adminhunter.User do
  use Adminhunter.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :encrypted_password, :string

    belongs_to :type, Adminhunter.Type

    timestamps
  end

  @required_fields ~w(name email type_id)
  @optional_fields ~w(password)

  defp set_encrypted_password(changeset) do
    password = get_field(changeset, :password)
    cond do
      changeset.action == :create || changeset.action == :edit ->
        change(changeset, %{encrypted_password: hash(password)})
      true ->
        changeset
    end
  end

  def hash(str) do
    hashed = :crypto.hash(:sha256, str)
    hashed
    |> Base.encode16
    |> String.downcase
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_confirmation(:password)
    |> set_encrypted_password
  end
end
