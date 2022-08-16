defmodule Apex.Github.Client do
  use Tesla

  alias Apex.Error
  alias Tesla.Env

  @base_url "https://api.github.com"

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "Tesla"}]

  def get_user_repos(url \\ @base_url, user_name) do
    "#{url}/users/#{user_name}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 404}}) do
    {:error, Error.build_user_not_found_error()}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
end
