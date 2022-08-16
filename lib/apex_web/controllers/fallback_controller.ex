defmodule ApexWeb.FallbackController do
  use ApexWeb, :controller

  alias Apex.Error
  alias ApexWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
