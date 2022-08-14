defmodule Apex.Github.Client do
  use Tesla

  @base_url "https://api.github.com/"

  plug Tesla.Middleware.JSON

  def get_user_repos(url \\ @base_url, user_name) do
    "#{url}/users/#{user_name}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get(return) do
    return |> IO.inspect()
  end
end
