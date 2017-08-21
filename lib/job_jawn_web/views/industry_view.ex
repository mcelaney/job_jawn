defmodule JobJawnWeb.IndustryView do
  use JSONAPI.View, namespace: "/api"
  alias JobJawnWeb.IndustryView

  def render("index.json", %{industries: industries, conn: conn, params: params}) do
    IndustryView.index(industries, conn, params)
  end

  def render("show.json", %{industry: industry, conn: conn, params: params}) do
    IndustryView.show(industry, conn, params)
  end

  def fields(), do: [:name, :slug]
  def relationships(), do: [companies: JobJawnWeb.CompanyView]
  def type(), do: "industries"
end
