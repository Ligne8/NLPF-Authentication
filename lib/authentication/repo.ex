defmodule Authentication.Repo do
  use Ecto.Repo,
    otp_app: :authentication,
    adapter: Mongo.Ecto
end
