defmodule AuthApiWeb.ItemController do
  use AuthApiWeb, :controller
  alias AuthApi.Mongo

  def index(conn, _params) do
    items = Mongo.find_all("items")
    json(conn, items)
  end
end
