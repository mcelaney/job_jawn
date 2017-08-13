defmodule JobJawn.ListingTest do
  use JobJawn.DataCase
  alias JobJawn.Listing
  alias JobJawn.Listing.{Address,
                         Company,
                         Discipline,
                         EmploymentType,
                         Industry,
                         Job,
                         Skill,
                         Title}

  setup _ do
    disciplines = :test |> Discipline.fixtures_data() |> fetch_fixtures(Discipline)
    industries = :test |> Industry.fixtures_data() |> fetch_fixtures(Industry)
    skills = :test |> Skill.fixtures_data() |> fetch_fixtures(Skill)
    employment_types = :test |> EmploymentType.fixtures_data() |> fetch_fixtures(EmploymentType)
    titles = :test |> Title.fixtures_data(disciplines) |> fetch_fixtures(Title)
    companies = :test |> Company.fixtures_data(industries) |> fetch_fixtures(Company)
    addresses = :test |> Address.fixtures_data(companies) |> fetch_fixtures(Address)
    jobs = :test |> Job.fixtures_data({companies, employment_types, titles, addresses, skills}) |> Job.fetch_fixtures()

    [disciplines: disciplines,
      industries: industries,
      skills: skills,
      titles: titles,
      employment_types: employment_types,
      companies: companies,
      addresses: addresses,
      job_count: Enum.count(jobs)]
  end

  test "fetch_grouped_listings/2 defaults to group jobs by company", %{companies: companies} do
    jobs = Listing.fetch_grouped_listings(Job)

    companies
    |> Map.keys
    |> Enum.each(fn(company) ->
         assert Map.has_key?(jobs, company)
       end)
  end

  test "fetch_grouped_listings(Job, :discipline) returns all jobs grouped by discipline", %{disciplines: disciplines} do
    jobs = Listing.fetch_grouped_listings(Job, :discipline)

    disciplines
    |> Map.keys
    |> Enum.each(fn(discipline) ->
         assert Map.has_key?(jobs, discipline)
       end)
  end

  test "fetch_grouped_listings(Job, :title) returns all jobs grouped by title", %{titles: titles} do
    jobs = Listing.fetch_grouped_listings(Job, :title)

    titles
    |> Map.keys
    |> Enum.each(fn(title) ->
         assert Map.has_key?(jobs, title)
       end)
  end

  test "fetch_grouped_listings(Job, :industry) returns all jobs grouped by industry", %{industries: industries} do
    jobs = Listing.fetch_grouped_listings(Job, :industry)

    industries
    |> Map.keys
    |> Enum.each(fn(industry) ->
         assert Map.has_key?(jobs, industry)
       end)
  end

  test "filter/1 will filter jobs by company", %{companies: companies} do
    filter_map = %{company: [companies[:one_trick_pony].id]}
    assert filter_meh(filter_map) |> Enum.count == 4
  end

  test "filter/1 will filter jobs by discipline", %{disciplines: disciplines} do
    filter_map = %{discipline: [disciplines[:design].id]}
    assert filter_meh(filter_map) |> Enum.count == 3
  end

  test "filter/1 will filter jobs by title", %{titles: titles} do
    filter_map = %{title: [titles[:copywriter].id]}
    assert filter_meh(filter_map) |> Enum.count == 5
  end

  test "filter/1 will filter jobs by industry", %{industries: industries} do
    filter_map = %{industry: [industries[:media].id]}
    assert filter_meh(filter_map) |> Enum.count == 8
  end

  test "filter/1 will filter by multiple facets",
       %{companies: companies, disciplines: disciplines, titles: titles, industries: industries} do
    filter_map = %{company: [companies[:one_trick_pony].id], title: [titles[:copywriter].id]}
    assert filter_meh(filter_map) |> Enum.count == 2

    filter_map = %{company: [companies[:al_dia].id, companies[:one_trick_pony].id], title: [titles[:copywriter].id]}
    assert filter_meh(filter_map) |> Enum.count == 3

    filter_map = %{company: [companies[:al_dia].id, companies[:one_trick_pony].id], discipline: [disciplines[:content].id]}
    assert filter_meh(filter_map) |> Enum.count == 6

    filter_map = %{industry: [industries[:advertising].id], discipline: [disciplines[:sales].id]}
    assert filter_meh(filter_map) |> Enum.count == 3

    filter_map = %{industry: [industries[:advertising].id], title: [titles[:photographer].id]}
    assert filter_meh(filter_map) |> Enum.count == 1
  end

  def filter_meh(filter_map), do: Job |> Listing.filter(filter_map) |> Repo.all
end
