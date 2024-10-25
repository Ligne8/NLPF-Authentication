defmodule AuthenticationWeb.Router do
  use AuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug :protect_from_forgery
    plug :put_root_layout, {AuthenticationWeb.LayoutView, :root}
  end

  scope "/api", AuthenticationWeb do
    pipe_through :api

    post "/auth/login", AuthController, :login
    post "/auth/register", AuthController, :register
  end
end
