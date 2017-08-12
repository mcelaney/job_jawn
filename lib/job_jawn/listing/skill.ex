defmodule JobJawn.Listing.Skill do
  @moduledoc """
  Needed job skills
  """
  use Ecto.Schema

  schema "skills" do
    field :name, :string
    field :slug, Symbol

    timestamps()
  end

  def fixtures_data(:test) do
    [{:elixir, %{name: "Elixir", slug: "elixir"}},
     {:Rails, %{name: "Rails", slug: "rails"}},
     {:js, %{name: "JavaScript", slug: "javascript"}},
     {:php, %{name: "PHP", slug: "php"}}]
  end

  def fixtures_data(:seed) do
    [{:elixir, %{name: "Elixir", slug: "elixir"}},
     {:Rails, %{name: "Rails", slug: "rails"}},
     {:js, %{name: "JavaScript", slug: "javascript"}},
     {:php, %{name: "PHP", slug: "php"}}]
  end
end
