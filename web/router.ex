defmodule Adminhunter.Router do
  use Adminhunter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Adminhunter do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/clients", ClientController
    resources "/types", TypeController, only: [:index]
  end

end
