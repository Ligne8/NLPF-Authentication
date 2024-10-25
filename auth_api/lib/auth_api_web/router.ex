defmodule AuthApiWeb.Router do
  use AuthApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthApiWeb do
    pipe_through :api
    resources "/items", ItemController, only: [:index]
  end
end
