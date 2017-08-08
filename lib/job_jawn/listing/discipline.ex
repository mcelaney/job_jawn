defmodule JobJawn.Listing.Discipline do
  @moduledoc """
  The discipline of a title - Design, Content, Development, etc
  """
  use Ecto.Schema

  schema "disciplines" do
    field :name, :string
    field :slug, :string

    timestamps()
  end
end
