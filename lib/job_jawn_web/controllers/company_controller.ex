defmodule JobJawnWeb.CompanyController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Company

  def index(conn, params) do
    companies = Repo.all(Company) |> Repo.preload([:addresses, :industry, :jobs])
    render(conn, "index.json", %{companies: companies, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get!(Company, id) |> Repo.preload([:addresses, :industry, :jobs])
    render(conn, "show.json", %{company: company, conn: conn, params: id})
  end
end
