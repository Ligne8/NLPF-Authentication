defmodule AuthApi.MongoTest do
  alias Mongo

  def test_connection do
    case Mongo.find(:mongo, "test_collection", %{}) do
      {:ok, cursor} ->
        IO.inspect Enum.to_list(cursor)
        {:ok, "Connexion réussie!"}
      {:error, reason} ->
        IO.inspect reason
        {:error, "Échec de la connexion"}
    end
  end
end
