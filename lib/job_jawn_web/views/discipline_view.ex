defmodule JobJawnWeb.DisciplineView do
  use JSONAPI.View, namespace: "/api"
  alias JobJawnWeb.DisciplineView

  def render("index.json", %{disciplines: disciplines, conn: conn, params: params}) do
    DisciplineView.index(disciplines, conn, params)
  end

  def render("show.json", %{discipline: discipline, conn: conn, params: params}) do
    DisciplineView.show(discipline, conn, params)
  end

  def fields(), do: [:name, :slug]
  def relationships(), do: [jobs: JobJawnWeb.JobView, titles: JobJawnWeb.TitleView]
  def type(), do: "disciplines"
end
