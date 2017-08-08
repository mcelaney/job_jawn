defmodule JobJawn.Listing.Industry do
  @moduledoc """
  The industry served by a given company such as healthcare, advertising, or
    finance
  """
  use Ecto.Schema
  schema "industries" do
    field :name, :string
    field :slug, :string

    timestamps()
  end
end
