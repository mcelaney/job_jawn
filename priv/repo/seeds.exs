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
industries =
  [{:advertising, %{name: "Advertising", slug: "advertising"}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Industry
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

companies =
  [{:one_trick, %{name: "1 Trick Pony",
                  slug: "one_trick_pony",
                  homepage: "http://1trickpony.com/",
                  jobs_page: "http://1trickpony.com/jobs",
                  industry_id: industries[:advertising].id}},
   {:one_sixty_over_ninty, %{name: "160over90",
                  slug: "one_sixty_over_ninty",
                  homepage: "http://160over90.com/",
                  jobs_page: "http://160over90.com/careers/",
                  industry_id: industries[:advertising].id}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Company
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

addresses =
  [{:one_trick_hammonton, %{city: "Hammonton",
                            lat: 39.6373204,
                            line_1: "251 Bellevue Ave # 3",
                            # line_2: ,
                            long: -74.8045421,
                            phone: "(609) 704-2660",
                            state: "NJ",
                            zip: "08037",
                            company_id: companies[:one_trick].id}},
   {:one_sixty_over_ninty_philly, %{city: "Philadelphia",
                            lat: 39.9474912,
                            line_1: "510 Walnut St",
                            # line_2: ,
                            long: -75.1499848,
                            phone: "(215) 732-3200",
                            state: "PA",
                            zip: "19106",
                            company_id: companies[:one_sixty_over_ninty].id}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Address
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

disciplines =
  [{:design, %{name: "Design", slug: "design"}},
   {:content, %{name: "Content", slug: "content"}},
   {:sales, %{name: "Business Development", slug: "sales"}},
   {:pm, %{name: "Project Management", slug: "pm"}},
   {:media, %{name: "Media", slug: "media"}},
   {:data, %{name: "Data", slug: "data"}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Discipline
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

employment_types =
  [{:full_time, %{name: "FTE", slug: "full_time"}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.EmploymentType
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

titles =
  [{:visual, %{name: "Visual Designer",
               slug: "visual_designer",
               discipline_id: disciplines[:design].id}},
   {:copywriter, %{name: "Copywriter",
               slug: "copywriter",
               discipline_id: disciplines[:content].id}},
   {:crm, %{name: "Customer Relationship Manager",
            slug: "crm",
            discipline_id: disciplines[:content].id}},
   {:video, %{name: "Video Producer",
            slug: "video",
            discipline_id: disciplines[:media].id}},
   {:photo, %{name: "Photographer",
            slug: "photographer",
            discipline_id: disciplines[:media].id}},
   {:analytics, %{name: "Analytics",
            slug: "analytics",
            discipline_id: disciplines[:data].id}},
   {:pm, %{name: "Project Manager",
            slug: "pm",
            discipline_id: disciplines[:pm].id}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Title
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

skills =
  [{:elixir, %{name: "Elixir", slug: "elixir"}},
   {:Rails, %{name: "Rails", slug: "rails"}},
   {:js, %{name: "JavaScript", slug: "javascript"}}]
  |> Enum.reduce(%{}, fn({key, params}, acc) ->
       JobJawn.Listing.Skill
       |> struct(params)
       |> JobJawn.Repo.insert!()
       |> (&Map.put(acc, key, &1)).()
     end)

[{%{
    name: "GRAPHIC DESIGNER",
    url: "http://1trickpony.com/jobs/graphic-designer",
    company_id: companies[:one_trick].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:visual].id,
    address_id: addresses[:one_trick_hammonton].id
}, {}},
{%{
    name: "ACCOUNT COORDINATOR",
    url: "http://1trickpony.com/jobs/account-coordinator",
    company_id: companies[:one_trick].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:crm].id,
    address_id: addresses[:one_trick_hammonton].id
}, {}},
{%{
    name: "COPYWRITER",
    url: "http://1trickpony.com/jobs/copywriter",
    company_id: companies[:one_trick].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:copywriter].id,
    address_id: addresses[:one_trick_hammonton].id
}, {}},
{%{
    name: "SR. COPYWRITER / CONCEPT LEAD",
    url: "http://1trickpony.com/jobs/sr-copywriter-concept-lead",
    company_id: companies[:one_trick].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:copywriter].id,
    address_id: addresses[:one_trick_hammonton].id
}, {}},
{%{
    name: "Account Director",
    url: "http://160over90.com/careers/?job_id=b629f121-0df0-49cf-afd6-a2169ca98efd",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:crm].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Account Supervisor",
    url: "http://160over90.com/careers/?job_id=0c3e5456-84fb-4f43-bc31-cb4a93503620",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:crm].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Lead Photographer/Art Buyer",
    url: "http://160over90.com/careers/?job_id=c436d12b-b418-4d0b-8197-e58118982f59",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:photo].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Program Manager",
    url: "http://160over90.com/careers/?job_id=d167f19b-702a-4385-87d3-83fac43c5201",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:pm].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Associate Creative Director - Copy",
    url: "http://160over90.com/careers/?job_id=10259cf6-2899-453a-83bd-25fee1518b1c",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:copywriter].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Copywriter",
    url: "http://160over90.com/careers/?job_id=4e242c85-4a53-4dc0-85ce-d1e1da66fada",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:copywriter].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Creative Director",
    url: "http://160over90.com/careers/?job_id=28ba77d7-2011-46e2-aa72-36ee32fda4be",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:visual].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Media Coordinator",
    url: "http://160over90.com/careers/?job_id=d7733586-b28f-4b34-9a3a-ec2305486f5a",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:analytics].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Senior Motion Designer",
    url: "http://160over90.com/careers/?job_id=5e5a32bd-e0b9-4c5d-b128-35fc39ae6851",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:video].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}},
{%{
    name: "Video Project Manager",
    url: "http://160over90.com/careers/?job_id=f2938078-6f69-490c-8977-0d00a79a51e1",
    company_id: companies[:one_sixty_over_ninty].id,
    employment_type_id: employment_types[:full_time].id,
    title_id: titles[:pm].id,
    address_id: addresses[:one_sixty_over_ninty_philly].id
}, {}}]
|> Enum.each(fn({params, skills}) ->
     JobJawn.Listing.Job
     |> struct(params)
     |> JobJawn.Repo.insert!()
   end)







