defmodule HipsterskaStrona.Router do
  use HipsterskaStrona.Web, :router
  use ExAdmin.Router
  use Coherence.Router

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

  pipeline :protected_admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
    plug HipsterskaStrona.Plugs.Authorized
  end

  scope "/", HipsterskaStrona do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/kawa", HipsterskaStrona do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :coffe
  end

  scope "/admin", ExAdmin do
    pipe_through :protected_admin
    resources "/coffe", CoffeItemController
    admin_routes()
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end



  # Other scopes may use custom stacks.
  # scope "/api", HipsterskaStrona do
  #   pipe_through :api
  # end
end
