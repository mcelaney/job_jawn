defmodule JobJawnWeb.SkillView do
  use JSONAPI.View
  alias JobJawnWeb.SkillView

  def render("index.json", %{skills: skills, conn: conn, params: params}) do
    SkillView.index(skills, conn, params)
  end

  def render("show.json", %{skill: skill, conn: conn, params: params}) do
    SkillView.show(skill, conn, params)
  end

  def fields(), do: [:name, :slug]
  def type(), do: "skill"
end
