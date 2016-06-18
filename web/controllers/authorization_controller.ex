defmodule PhoenixBoilerplate.AuthorizationController do
  use PhoenixBoilerplate.Web, :controller
  use Guardian.Phoenix.Controller

  alias PhoenixBoilerplate.Repo

  def index(conn, _params, current_user, _claims) do
    render conn, "index.html", current_user: current_user, authorizations: authorizations(current_user)
  end

  defp authorizations(user) do
    Ecto.Model.assoc(user, :authorizations) |> Repo.all
  end
end
