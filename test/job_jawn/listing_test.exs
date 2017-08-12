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

  test "grouped_listings(:discipline) returns all jobs grouped by discipline",
       %{disciplines: disciplines} do
    jobs = Listing.grouped_listings(:discipline)

    disciplines
    |> Map.keys
    |> Enum.each(fn(discipline) ->
         assert Map.has_key?(jobs, discipline)
       end)
  end
end