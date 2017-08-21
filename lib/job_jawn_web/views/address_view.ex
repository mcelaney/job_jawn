defmodule JobJawnWeb.AddressView do
  use JSONAPI.View, namespace: "/api"
  alias JobJawnWeb.AddressView

  def render("index.json", %{addresses: addresses, conn: conn, params: params}) do
    AddressView.index(addresses, conn, params)
  end

  def render("show.json", %{address: address, conn: conn, params: params}) do
    AddressView.show(address, conn, params)
  end

  def fields(), do: [:city, :lat, :line_1, :line_2, :long, :phone, :state, :zip]
  def includes(), do: [company: {JobJawnWeb.CompanyView, :include}]
  def type(), do: "addresses"
end
