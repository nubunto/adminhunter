defmodule Adminhunter.TypeControllerTest do
  use Adminhunter.ConnCase

  alias Adminhunter.Type
  @valid_attrs %{limit: 42, name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, type_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing type"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, type_path(conn, :new)
    assert html_response(conn, 200) =~ "New type"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, type_path(conn, :create), type: @valid_attrs
    assert redirected_to(conn) == type_path(conn, :index)
    assert Repo.get_by(Type, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, type_path(conn, :create), type: @invalid_attrs
    assert html_response(conn, 200) =~ "New type"
  end

  test "shows chosen resource", %{conn: conn} do
    type = Repo.insert! %Type{}
    conn = get conn, type_path(conn, :show, type)
    assert html_response(conn, 200) =~ "Show type"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, type_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    type = Repo.insert! %Type{}
    conn = get conn, type_path(conn, :edit, type)
    assert html_response(conn, 200) =~ "Edit type"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    type = Repo.insert! %Type{}
    conn = put conn, type_path(conn, :update, type), type: @valid_attrs
    assert redirected_to(conn) == type_path(conn, :show, type)
    assert Repo.get_by(Type, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    type = Repo.insert! %Type{}
    conn = put conn, type_path(conn, :update, type), type: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit type"
  end

  test "deletes chosen resource", %{conn: conn} do
    type = Repo.insert! %Type{}
    conn = delete conn, type_path(conn, :delete, type)
    assert redirected_to(conn) == type_path(conn, :index)
    refute Repo.get(Type, type.id)
  end
end
