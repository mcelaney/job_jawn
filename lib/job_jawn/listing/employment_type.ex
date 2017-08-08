defmodule JobJawn.Listing.EmploymentType do
  @moduledoc """
  Type of job this is - Full time, intership, etc
  """
  use Ecto.Schema

  schema "employment_types" do
    field :name, :string
    field :slug, :string

    timestamps()
  end
end
