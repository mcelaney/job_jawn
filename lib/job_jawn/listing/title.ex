defmodule JobJawn.Listing.Title do
  @moduledoc """
  A generalized title for the job - Visual Designer, Backend Developer, etc
  """
  use Ecto.Schema

  schema "titles" do
    field :name, :string
    field :slug, :string

    timestamps()
  end
end
