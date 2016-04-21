defmodule Adminhunter.Client do
  use Adminhunter.Web, :model

  schema "clients" do
    field :name, :string
    field :type, :string
    field :social_reason, :string
    field :cpf, :string
    field :cnpj, :string
    field :observation, :string

    embeds_one :address, Adminhunter.Address, on_replace: :delete
    embeds_one :contact, Adminhunter.Contact, on_replace: :delete

    timestamps
  end

  @required_fields ~w(name type social_reason cpf cnpj observation)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_embed(:address, required: false)
    |> cast_embed(:contact, required: false)
  end
end



defmodule Adminhunter.Address do
  use Adminhunter.Web, :model

  embedded_schema do
    field :address
    field :number, :integer
    field :complement
    field :neighborhood
    field :postal_code
    field :city
  end

  @required_fields ~w(address number)
  @optional_fields ~w(neighborhood postal_code city complement)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

defmodule Adminhunter.Contact do
  use Adminhunter.Web, :model

  embedded_schema do
    field :name
    field :emails, {:array, :string}
    field :phones, {:array, :string}
    field :cell_phone
  end

  @required_fields ~w(name cell_phone)
  @optional_fields ~w(emails phones)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
