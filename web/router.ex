defmodule Chs.Router do
  use Chs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/splash", PageController, :splash
    get "/cat", CatController, :hello
    get "/cat/:name", CatController, :hello
    
    resources "/users", UserController

  end

  # Other scopes may use custom stacks.
  # scope "/api", Chs do
  #   pipe_through :api
  # end
end

defmodule Chs.AuthController do
  use Chs.Web, :controller
  plug Ueberauth

end
