defmodule AuthenticationWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :authentication

  # Configure the WebSocket socket if needed
  socket "/socket", AuthenticationWeb.UserSocket

  # Configure the plug to handle requests
  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
  plug Plug.Logger

  plug Plug.CSRFProtection
  plug Plug.MethodOverride
  plug Plug.Head

  # Handle API requests
  plug Plug.Accepts, ["json"]

  plug AuthenticationWeb.Router

  # Plug for session management
  plug Plug.Session,
    store: :cookie,
    key: "_authentication_key",
    signing_salt: :crypto.strong_rand_bytes(16) |> Base.encode64() |> binary_part(0, 16)
end
