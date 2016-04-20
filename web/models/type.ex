defmodule Adminhunter.Type do
  use Adminhunter.Web, :model

  schema "types" do
    field :name, :string
    field :limit, :integer
    field :type_identifier, :string

    has_many :users, Adminhunter.User
    timestamps
  end

  @required_fields ~w(name limit)
  @optional_fields ~w(type_identifier)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
