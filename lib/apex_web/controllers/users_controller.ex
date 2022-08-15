defmodule ApexWeb.UsersController do
  use ApexWeb, :controller

  def show(conn, %{"id" => user_name}) do
    with {:ok, repos} <- Apex.get_user_repos(user_name) do
      conn
      |> put_status(:ok)
      |> render("user_repos.json", repos: repos)
    end
  end
end
