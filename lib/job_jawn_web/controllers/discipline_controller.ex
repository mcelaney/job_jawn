defmodule JobJawnWeb.DisciplineController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Discipline

  def index(conn, params) do
    disciplines = Repo.all(Discipline) |> Repo.preload(:titles)
    render(conn, "index.json", %{disciplines: disciplines, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    discipline = Repo.get!(Discipline, id) |> Repo.preload(:titles)
    render(conn, "show.json", %{discipline: discipline, conn: conn, params: id})
  end
end
