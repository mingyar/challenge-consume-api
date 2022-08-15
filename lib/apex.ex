defmodule Apex do
  alias Apex.Users.Get, as: UserGet

  defdelegate get_user_repos(params), to: UserGet, as: :repos_by_name
end
