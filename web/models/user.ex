defmodule Adminhunter.User do
  use Adminhunter.Web, :model

  alias Adminhunter.{Repo, Type}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :encrypted_password, :string

    belongs_to :type, Adminhunter.Type

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  defp set_encrypted_password(changeset) do
    password = get_field(changeset, :password)
    cond do
      changeset.action == :create || changeset.action == :edit ->
        change(changeset, %{encrypted_password: hash(password)})
      true ->
        changeset
    end
  end

  # defp set_type(changeset) do
  #   type_id = get_field(changeset, :v_type)
  #   type = Repo.get!(Type, type_id)
  #   put_assoc(changeset, :type, type)
  # end

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
