defmodule JobJawnWeb.SkillController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Skill

  def index(conn, params) do
    skills = Repo.all(Skill)
    render(conn, "index.json", %{skills: skills, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    skill = Repo.get!(Skill, id)
    render(conn, "show.json", %{skill: skill, conn: conn, params: id})
  end
end
