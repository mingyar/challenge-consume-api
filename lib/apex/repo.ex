defmodule Apex.Repo do
  use Ecto.Repo,
    otp_app: :apex,
    adapter: Ecto.Adapters.Postgres
end
