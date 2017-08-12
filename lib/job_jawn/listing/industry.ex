defmodule JobJawn.Listing.Industry do
  @moduledoc """
  The industry served by a given company such as healthcare, advertising, or
    finance
  """
  use Ecto.Schema

  schema "industries" do
    field :name, :string
    field :slug, Symbol

    timestamps()
  end

  def fixtures_data(:test) do
    [{:advertising, %{name: "Advertising", slug: "advertising"}},
     {:media, %{name: "Media", slug: "media"}}]
  end

  def fixtures_data(:seed) do
    [{:advertising, %{name: "Advertising", slug: "advertising"}},
     {:media, %{name: "Media", slug: "media"}}]
  end
end
