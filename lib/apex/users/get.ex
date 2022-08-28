defmodule Apex.Users.Get do
  alias Apex.{Error, Repo, User, Github.Client}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

  def repos_by_name(name) do
    case Client.get_user_repos(name) do
      {:ok, repos} -> {:ok, format_fields(repos)}
      {:error, %Error{} = error} -> {:error, error}
    end
  end

  defp format_fields(repos) do
    repos
    |> Enum.map(fn %{
                     "id" => id,
                     "name" => name,
                     "description" => description,
                     "html_url" => html_url,
                     "stargazers_count" => stargazers_count
                   } ->
      %{
        id: id,
        name: name,
        description: description,
        html_url: html_url,
        stargazers_count: stargazers_count
      }
    end)
  end
end
