defmodule JobJawn.Listing.Discipline do
  @moduledoc """
  The discipline of a title - Design, Content, Development, etc
  """
  use Ecto.Schema

  schema "disciplines" do
    field :name, :string
    field :slug, Symbol

    timestamps()
  end

  def fixtures_data(:test) do
    [{:design, %{name: "Design", slug: "design"}},
     {:content, %{name: "Content", slug: "content"}},
     {:sales, %{name: "Business Development", slug: "sales"}},
     {:pm, %{name: "Project Management", slug: "pm"}},
     {:media, %{name: "Media", slug: "media"}},
     {:data, %{name: "Data", slug: "data"}},
     {:marketing, %{name: "Marketing", slug: "marketing"}}]
  end

  def fixtures_data(:seed) do
    [{:design, %{name: "Design", slug: "design"}},
     {:content, %{name: "Content", slug: "content"}},
     {:sales, %{name: "Business Development", slug: "sales"}},
     {:pm, %{name: "Project Management", slug: "pm"}},
     {:media, %{name: "Media", slug: "media"}},
     {:data, %{name: "Data", slug: "data"}},
     {:marketing, %{name: "Marketing", slug: "marketing"}}]
  end
end
