defmodule JobJawnWeb.TitleController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Title

  def index(conn, params) do
    titles = Repo.all(Title) |> Repo.preload([:discipline, :jobs])
    render(conn, "index.json", %{titles: titles, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    title = Repo.get!(Title, id) |> Repo.preload([:discipline, :jobs])
    render(conn, "show.json", %{title: title, conn: conn, params: id})
  end
end
