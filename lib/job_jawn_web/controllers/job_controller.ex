defmodule JobJawnWeb.JobController do
  use JobJawnWeb, :controller
  alias JobJawn.Listing.Job

  def index(conn, params) do
    jobs = Repo.all(Job) |> Repo.preload([:company, :employment_type, :title, [address: [:company]]])
    render(conn, "index.json", %{jobs: jobs, conn: conn, params: params})
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get!(Job, id) |> Repo.preload([:company, :employment_type, :title, [address: [:company]]])
    render(conn, "show.json", %{job: job, conn: conn, params: id})
  end
end
