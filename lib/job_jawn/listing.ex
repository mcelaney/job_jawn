defmodule JobJawn.Listing do
  @moduledoc """
  Responsible for management of jobs and related information
  """
  import Ecto.Query
  alias JobJawn.Repo
  alias JobJawn.Listing.Job

  @type item_slug :: atom
  @type item_params :: map
  @type fixtures_data :: list({item_slug, item_params})
  @type fixtures :: %{item_slug => list(Job.t)}

  @spec grouped_listings(Job.job_grouping | any) :: Job.grouped_jobs
  def grouped_listings(grouping \\ :company) do
    Job
    |> preload([:employment_type, :address, [title: [:discipline]], [company: [:industry]]])
    |> Repo.all
    |> jobs_grouping(grouping)
  end

  @spec fetch_fixtures(fixtures_data, module) :: fixtures
  def fetch_fixtures(data, module) do
    unless Repo.aggregate(module, :count, :id) > 0 do
      Enum.reduce(data, %{}, fn({key, params}, acc) ->
        module
        |> struct(params)
        |> Repo.insert!()
        |> (&Map.put(acc, key, &1)).()
      end)
    end
  end
  @spec jobs_grouping(list(Job.t), Job.job_grouping) :: Job.grouped_jobs
  defp jobs_grouping(jobs, grouping) do
    case grouping do
      :discipline ->
        jobs |> Enum.group_by(&(&1.title.discipline.slug))
      :title ->
        jobs |> Enum.group_by(&(&1.title.slug))
      :industry ->
        jobs |> Enum.group_by(&(&1.company.industry.slug))
      _ -> # :company
        jobs |> Enum.group_by(&(&1.company.slug))
    end
  end
end
