defmodule ApexWeb.UsersView do
  use ApexWeb, :view

  alias Apex.User

  def render("user_repos.json", %{repos: repos}) do
    %{user_repos: repos}
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end
end
