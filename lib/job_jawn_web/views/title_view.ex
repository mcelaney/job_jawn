defmodule JobJawnWeb.TitleView do
  use JSONAPI.View
  alias JobJawnWeb.TitleView
  alias JobJawnWeb.JobView
  alias JobJawnWeb.DisciplineView

  def render("index.json", %{titles: titles, conn: conn, params: params}) do
    TitleView.index(titles, conn, params)
  end

  def render("show.json", %{title: title, conn: conn, params: params}) do
    TitleView.show(title, conn, params)
  end

  def fields(), do: [:name, :slug]
  def relationships(), do: [jobs: JobView]
  def includes(), do: [discipline: {DisciplineView, :include}]
  def type(), do: "title"
end
