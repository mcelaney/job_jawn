defmodule JobJawnWeb.JobView do
  use JSONAPI.View
  alias JobJawnWeb.AddressView
  alias JobJawnWeb.CompanyView
  alias JobJawnWeb.EmploymentTypeView
  alias JobJawnWeb.JobView
  alias JobJawnWeb.TitleView

  def render("index.json", %{jobs: jobs, conn: conn, params: params}) do
    JobView.index(jobs, conn, params)
  end

  def render("show.json", %{job: job, conn: conn, params: params}) do
    JobView.show(job, conn, params)
  end

  def fields(), do: [:name, :url]
  def includes() do
    [company: {CompanyView, :include},
     employment_type: {EmploymentTypeView, :include},
     title: {TitleView, :include},
     address: {AddressView, :include}]
  end
  def type(), do: "job"
end
