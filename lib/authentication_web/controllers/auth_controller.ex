defmodule AuthenticationWeb.AuthController do
  use AuthenticationWeb, :controller

  def login(conn, %{"email" => _email, "password" => _password}) do
    # Logic to handle login here
    json(conn, %{message: "Login successful"})
  end

  def register(conn, %{"email" => _email, "password" => _password}) do
    # Logic to handle registration here
    json(conn, %{message: "Registration successful"})
  end

end
