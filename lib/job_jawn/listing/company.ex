defmodule JobJawn.Listing.Company do
  @moduledoc """
  Organizations which may offer jobs
  """
  use Ecto.Schema
  alias JobJawn.Listing.Address
  alias JobJawn.Listing.Industry
  alias JobJawn.Listing.Job

  schema "companies" do
    field :homepage, :string
    field :jobs_page, :string
    field :name, :string
    field :slug, Symbol

    belongs_to :industry, Industry
    has_many :addresses, Address
    has_many :jobs, Job

    timestamps()
  end

  def fixtures_data(:test, industries) do
    [{:one_trick_pony, %{name: "1 Trick Pony",
                    slug: "one_trick_pony",
                    homepage: "http://1trickpony.com/",
                    jobs_page: "http://1trickpony.com/jobs",
                    industry_id: industries[:advertising].id}},
     {:one_sixty_over_ninty, %{name: "160over90",
                    slug: "one_sixty_over_ninty",
                    homepage: "http://160over90.com/",
                    jobs_page: "http://160over90.com/careers/",
                    industry_id: industries[:advertising].id}},
     {:al_dia, %{name: "AL DÍA",
                    slug: "al_dia",
                    homepage: "http://aldianews.com/",
                    jobs_page: "http://aldianews.com/pages/more/careers/34548",
                    industry_id: industries[:media].id}}]
  end

  def fixtures_data(:seed, industries) do
    [{:one_trick_pony, %{name: "1 Trick Pony",
                    slug: "one_trick_pony",
                    homepage: "http://1trickpony.com/",
                    jobs_page: "http://1trickpony.com/jobs",
                    industry_id: industries[:advertising].id}},
     {:one_sixty_over_ninty, %{name: "160over90",
                    slug: "one_sixty_over_ninty",
                    homepage: "http://160over90.com/",
                    jobs_page: "http://160over90.com/careers/",
                    industry_id: industries[:advertising].id}},
     {:al_dia, %{name: "AL DÍA",
                    slug: "al_dia",
                    homepage: "http://aldianews.com/",
                    jobs_page: "http://aldianews.com/pages/more/careers/34548",
                    industry_id: industries[:media].id}}]
  end
end
