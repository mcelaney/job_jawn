defmodule JobJawn.Listing.EmploymentType do
  @moduledoc """
  Type of job this is - Full time, intership, etc
  """
  use Ecto.Schema

  schema "employment_types" do
    field :name, :string
    field :slug, Symbol

    timestamps()
  end

  def fixtures_data(:test) do
    [{:full_time, %{name: "FTE - On Site", slug: "full_time"}},
     {:internship, %{name: "Internship", slug: "internship"}}]
  end

  def fixtures_data(:seed) do
    [{:full_time, %{name: "FTE - On Site", slug: "full_time"}},
     {:internship, %{name: "Internship", slug: "internship"}}]
  end
end
