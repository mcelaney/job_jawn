defmodule JobJawnWeb.CompanyView do
  use JSONAPI.View, namespace: "/api"
  alias JobJawnWeb.CompanyView
  alias JobJawnWeb.JobView

  def render("index.json", %{companies: companies, conn: conn, params: params}) do
    CompanyView.index(companies, conn, params)
  end

  def render("show.json", %{company: company, conn: conn, params: params}) do
    CompanyView.show(company, conn, params)
  end

  def fields(), do: [:homepage, :jobs_page, :name, :slug]
  def relationships(), do: [addresses: JobJawnWeb.AddressView, jobs: JobJawnWeb.JobView]
  def includes(), do: [industry: {JobJawnWeb.IndustryView, :include}]
  def type(), do: "companies"
end
