defmodule JobJawnWeb.IndustryController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Industry

  def index(conn, params) do
    industries = Repo.all(Industry) |> Repo.preload(:companies)
    render(conn, "index.json", %{industries: industries, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    industry = Repo.get!(Industry, id) |> Repo.preload(:companies)
    render(conn, "show.json", %{industry: industry, conn: conn, params: id})
  end
end
