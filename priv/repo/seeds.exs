# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JobJawn.Repo.insert!(%JobJawn.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias JobJawn.Listing
alias JobJawn.Listing.{
  Address,
  Company,
  Discipline,
  EmploymentType,
  Industry,
  Job,
  Skill,
  Title}

disciplines = :seed |> Discipline.fixtures_data() |> Listing.fetch_fixtures(Discipline)
industries = :seed |> Industry.fixtures_data() |> Listing.fetch_fixtures(Industry)
skills = :seed |> Skill.fixtures_data() |> Listing.fetch_fixtures(Skill)
employment_types = :seed |> EmploymentType.fixtures_data() |> Listing.fetch_fixtures(EmploymentType)
titles = :seed |> Title.fixtures_data(disciplines) |> Listing.fetch_fixtures(Title)
companies = :seed |> Company.fixtures_data(industries) |> Listing.fetch_fixtures(Company)
addresses = :seed |> Address.fixtures_data(companies) |> Listing.fetch_fixtures(Address)
:seed |> Job.fixtures_data({companies, employment_types, titles, addresses, skills}) |> Job.fetch_fixtures()
