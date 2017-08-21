defmodule JobJawnWeb.EmploymentTypeView do
  use JSONAPI.View
  alias JobJawnWeb.EmploymentTypeView
  alias JobJawnWeb.JobView

  def render("index.json", %{employment_types: employment_types, conn: conn, params: params}) do
    EmploymentTypeView.index(employment_types, conn, params)
  end

  def render("show.json", %{employment_type: employment_type, conn: conn, params: params}) do
    EmploymentTypeView.show(employment_type, conn, params)
  end

  def fields(), do: [:name, :slug]
  def relationships(), do: [jobs: JobJawnWeb.JobView]
  def type(), do: "employment_type"
end
