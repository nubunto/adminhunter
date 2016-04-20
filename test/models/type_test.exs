defmodule Adminhunter.TypeTest do
  use Adminhunter.ModelCase

  alias Adminhunter.Type

  @valid_attrs %{limit: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Type.changeset(%Type{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Type.changeset(%Type{}, @invalid_attrs)
    refute changeset.valid?
  end
end
