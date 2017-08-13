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

  @spec fetch_grouped_listings(Job.job_grouping | any) :: Job.grouped_jobs
  def fetch_grouped_listings(query, grouping \\ :company) do
    query
    |> preload([:employment_type,
                :address,
                [title: [:discipline]],
                [company: [:industry]]])
    |> Repo.all
    |> jobs_grouping(grouping)
  end

  def filter(query, filter_map) do
    query
    |> filter(filter_map, :title)
    |> filter(filter_map, :discipline)
    |> filter(filter_map, :company)
    |> filter(filter_map, :industry)
  end

  def filter(query, %{title: [_|_] = ids}, :title) do
    where(query, [job], job.title_id in ^ids)
  end

  def filter(query, %{discipline: [_|_] = ids}, :discipline) do
    query
    |> join(:left, [job], title in assoc(job, :title))
    |> where([_, title], title.discipline_id in ^ids)
  end

  def filter(query, %{company: [_|_] = ids}, :company) do
    where(query, [job], job.company_id in ^ids)
  end

  def filter(query, %{industry: [_|_] = ids}, :industry) do
    cond do
      JobJawn.Listing.Job == query ->
        query
        |> join(:left, [job], company in assoc(job, :company))
        |> where([_, company], company.industry_id in ^ids)
      Enum.count(query.joins) == 0 ->
        query
        |> join(:left, [job], company in assoc(job, :company))
        |> where([_, company], company.industry_id in ^ids)
      Enum.count(query.joins) == 1 ->
        query
        |> join(:left, [job], company in assoc(job, :company))
        |> where([_, _, company], company.industry_id in ^ids)
    end
  end
  def filter(query, _, _), do: query

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
