defmodule JobJawn.Listing.Skill do
  @moduledoc """
  Needed job skills
  """
  use Ecto.Schema

  schema "skills" do
    field :name, :string
    field :slug, :string

    timestamps()
  end
end
