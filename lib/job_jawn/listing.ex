defmodule JobJawn.Listing do
  @moduledoc """
  Responsible for management of jobs and related information
  """
  import Ecto.Query
  alias JobJawn.Repo
  alias JobJawn.Listing.Job

  def grouped_listings(:discipline) do
    Job
    |> preload([:company, :employment_type, :address, title: [:discipline]])
    |> Repo.all
    |> Enum.group_by(&(&1.title.discipline.slug))
    # |> Enum.reduce(%{}, )
# Sort each group
  end

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
end
