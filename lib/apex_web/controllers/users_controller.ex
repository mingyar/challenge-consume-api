defmodule ApexWeb.UsersController do
  use ApexWeb, :controller

  alias Apex.User

  alias ApexWeb.{FallbackController, Auth.Guardian}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Apex.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) |> IO.inspect() do
      conn
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def show(conn, %{"id" => user_name}) do
    with {:ok, repos} <- Apex.get_user_repos(user_name) do
      conn
      |> put_status(:ok)
      |> render("user_repos.json", repos: repos)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
