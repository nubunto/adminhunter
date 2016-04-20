defmodule Adminhunter.ClientTest do
  use Adminhunter.ModelCase

  alias Adminhunter.Client

  @valid_attrs %{cnpj: "some content", cpf: "some content", name: "some content", observation: "some content", social_reason: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Client.changeset(%Client{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Client.changeset(%Client{}, @invalid_attrs)
    refute changeset.valid?
  end
end
