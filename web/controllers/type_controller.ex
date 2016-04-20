defmodule Adminhunter.TypeController do
  use Adminhunter.Web, :controller

  alias Adminhunter.{Type, User}

  plug :scrub_params, "type" when action in [:create, :update]

  def index(conn, _params) do
    type = Repo.all(from t in Type, preload: [:users])
    render(conn, "index.html", type: type)
  end
end
