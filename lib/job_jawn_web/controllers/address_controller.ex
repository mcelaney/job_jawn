defmodule JobJawnWeb.AddressController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Address

  def index(conn, params) do
    addresses = Repo.all(Address) |> Repo.preload(:company)
    render(conn, "index.json", %{addresses: addresses, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    address = Repo.get!(Address, id) |> Repo.preload(:company)
    render(conn, "show.json", %{address: address, conn: conn, params: id})
  end
end
