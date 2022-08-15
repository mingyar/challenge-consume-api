defmodule ApexWeb.UsersView do
  use ApexWeb, :view

  def render("user_repos.json", %{repos: repos}) do
    %{user_repos: repos}
  end
end
