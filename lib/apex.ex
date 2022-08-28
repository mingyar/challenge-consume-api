defmodule Apex do
  alias Apex.Users.Create, as: UserCreate
  alias Apex.Users.Get, as: UserGet

  defdelegate get_user_repos(params), to: UserGet, as: :repos_by_name
  defdelegate create_user(params), to: UserCreate, as: :call
end
