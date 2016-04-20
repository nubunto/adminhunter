defmodule Adminhunter.UserController do
  use Adminhunter.Web, :controller

  alias Adminhunter.{User, Type}
  require Logger

  plug :scrub_params, "user" when action in [:create, :update]

  def index(conn, _params) do
    users = Repo.all(from u in User, preload: [:type])
    render(conn, "index.html", users: users)
  end

  defp all_types do
    Enum.reduce(Repo.all(Type), Keyword.new, fn type, ret ->
      Keyword.put(ret, :"#{type.name}", type.id)
    end)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset, types: all_types)
  end

  def create(conn, %{"user" => user_params}) do
    type =
      Repo.get!(Type, user_params["v_type"])
      |> Repo.preload(:users)
    cond do
      Enum.count(type.users) + 1 > type.limit ->
        render(conn, "new.html", changeset: User.changeset(%User{}), types: all_types, error: {:limit_reached, type})
      true ->
        user = Ecto.build_assoc(type, :users)
        changeset = User.changeset(user, user_params)
        case Repo.insert(changeset) do
          {:ok, _user} ->
            conn
            |> put_flash(:info, "Usuário criado com sucesso.")
            |> redirect(to: user_path(conn, :index))
          {:error, changeset} ->
            render(conn, "new.html", types: all_types, changeset: changeset)
        end
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset, types: all_types)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Usuário salvo com sucesso.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset, types: all_types)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "Usuário deletado com sucesso.")
    |> redirect(to: user_path(conn, :index))
  end
end
