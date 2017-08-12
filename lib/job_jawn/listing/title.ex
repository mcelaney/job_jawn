defmodule JobJawn.Listing.Title do
  @moduledoc """
  A generalized title for the job - Visual Designer, Backend Developer, etc
  """
  use Ecto.Schema
  alias JobJawn.Listing.Discipline

  schema "titles" do
    field :name, :string
    field :slug, Symbol

    belongs_to :discipline, Discipline

    timestamps()
  end

  def fixtures_data(:test, disciplines) do
    [{:visual_designer, %{name: "Visual Designer",
                 slug: "visual_designer",
                 discipline_id: disciplines[:design].id}},
     {:copywriter, %{name: "Copywriter",
                 slug: "copywriter",
                 discipline_id: disciplines[:content].id}},
     {:crm, %{name: "Customer Relationship Manager",
              slug: "crm",
              discipline_id: disciplines[:sales].id}},
     {:sales, %{name: "Sales",
              slug: "sales",
              discipline_id: disciplines[:sales].id}},
     {:video, %{name: "Video Producer",
              slug: "video",
              discipline_id: disciplines[:media].id}},
     {:photographer, %{name: "Photographer",
              slug: "photographer",
              discipline_id: disciplines[:media].id}},
     {:analytics, %{name: "Analytics",
              slug: "analytics",
              discipline_id: disciplines[:data].id}},
     {:marketing, %{name: "Marketing Specialist",
              slug: "marketing",
              discipline_id: disciplines[:marketing].id}},
     {:pm, %{name: "Project Manager",
              slug: "pm",
              discipline_id: disciplines[:pm].id}},
     {:editor, %{name: "Editor",
              slug: "editor",
              discipline_id: disciplines[:content].id}}]
  end

  def fixtures_data(:seed, disciplines) do
    [{:visual_designer, %{name: "Visual Designer",
                 slug: "visual_designer",
                 discipline_id: disciplines[:design].id}},
     {:copywriter, %{name: "Copywriter",
                 slug: "copywriter",
                 discipline_id: disciplines[:content].id}},
     {:crm, %{name: "Customer Relationship Manager",
              slug: "crm",
              discipline_id: disciplines[:sales].id}},
     {:sales, %{name: "Sales",
              slug: "sales",
              discipline_id: disciplines[:sales].id}},
     {:video, %{name: "Video Producer",
              slug: "video",
              discipline_id: disciplines[:media].id}},
     {:photographer, %{name: "Photographer",
              slug: "photographer",
              discipline_id: disciplines[:media].id}},
     {:analytics, %{name: "Analytics",
              slug: "analytics",
              discipline_id: disciplines[:data].id}},
     {:marketing, %{name: "Marketing Specialist",
              slug: "marketing",
              discipline_id: disciplines[:marketing].id}},
     {:pm, %{name: "Project Manager",
              slug: "pm",
              discipline_id: disciplines[:pm].id}},
     {:editor, %{name: "Editor",
              slug: "editor",
              discipline_id: disciplines[:content].id}}]
  end
end
