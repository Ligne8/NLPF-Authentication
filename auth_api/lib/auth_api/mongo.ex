defmodule AuthApi.Mongo do
  use GenServer
  alias Mongo

  @mongo_config Application.compile_env(:auth_api, __MODULE__)

  # Connexion MongoDB
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    {:ok, conn} = Mongo.start_link(url: @mongo_config[:url])
    {:ok, %{conn: conn}}
  end

  def find_all(collection) do
    Mongo.find(@mongo_config[:url], collection, %{}) |> Enum.to_list()
  end
end
