defmodule JobJawnWeb.EmploymentTypeController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.EmploymentType

  def index(conn, params) do
    employment_types = Repo.all(EmploymentType) |> Repo.preload(:jobs)
    render(conn, "index.json", %{employment_types: employment_types, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    employment_type = Repo.get!(EmploymentType, id) |> Repo.preload(:jobs)
    render(conn, "show.json", %{employment_type: employment_type, conn: conn, params: id})
  end
end
