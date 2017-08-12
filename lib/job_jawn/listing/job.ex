defmodule JobJawn.Listing.Job do
  # credo:disable-for-this-file Credo.Check.Refactor.ABCSize

  @moduledoc """
  A job.  You know... why we're here
  """
  use Ecto.Schema
  alias JobJawn.Repo
  alias JobJawn.Listing.Company
  alias JobJawn.Listing.EmploymentType
  alias JobJawn.Listing.Title
  alias JobJawn.Listing.Address

  @type t :: %__MODULE__{}
  @type job_grouping :: :discipline | :title | :industry | :company
  @type grouped_jobs :: %{job_grouping => list(t)}

  schema "jobs" do
    field :name, :string
    field :url, :string

    belongs_to :company, Company
    belongs_to :employment_type, EmploymentType
    belongs_to :title, Title
    belongs_to :address, Address

    timestamps()
  end

  def fetch_fixtures(data) do
    unless Repo.aggregate(__MODULE__, :count, :id) > 0 do
      Enum.map(data, fn({params, _skills}) ->
       __MODULE__
       |> struct(params)
       |> Repo.insert!()
      end)
    end
  end

  def fixtures_data(:test, {companies, employment_types, titles, addresses, skills}) do
    [{%{
        name: "GRAPHIC DESIGNER",
        url: "http://1trickpony.com/jobs/graphic-designer",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "ACCOUNT COORDINATOR",
        url: "http://1trickpony.com/jbs/account-coordinator",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "COPYWRITER",
        url: "http://1trickpony.com/jobs/copywriter",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "SR. COPYWRITER / CONCEPT LEAD",
        url: "http://1trickpony.com/jobs/sr-copywriter-concept-lead",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "Account Director",
        url: "http://160over90.com/careers/?job_id=b629f121-0df0-49cf-afd6-a2169ca98efd",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Account Supervisor",
        url: "http://160over90.com/careers/?job_id=0c3e5456-84fb-4f43-bc31-cb4a93503620",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Lead Photographer/Art Buyer",
        url: "http://160over90.com/careers/?job_id=c436d12b-b418-4d0b-8197-e58118982f59",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:photographer].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Program Manager",
        url: "http://160over90.com/careers/?job_id=d167f19b-702a-4385-87d3-83fac43c5201",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:pm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Associate Creative Director - Copy",
        url: "http://160over90.com/careers/?job_id=10259cf6-2899-453a-83bd-25fee1518b1c",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Copywriter",
        url: "http://160over90.com/careers/?job_id=4e242c85-4a53-4dc0-85ce-d1e1da66fada",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Creative Director",
        url: "http://160over90.com/careers/?job_id=28ba77d7-2011-46e2-aa72-36ee32fda4be",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Media Coordinator",
        url: "http://160over90.com/careers/?job_id=d7733586-b28f-4b34-9a3a-ec2305486f5a",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:analytics].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Senior Motion Designer",
        url: "http://160over90.com/careers/?job_id=5e5a32bd-e0b9-4c5d-b128-35fc39ae6851",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:video].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Video Project Manager",
        url: "http://160over90.com/careers/?job_id=f2938078-6f69-490c-8977-0d00a79a51e1",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:pm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Digital Editor",
        url: "http://aldianews.com/pages/digital-editor/34550",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Content Producer",
        url: "http://aldianews.com/pages/bilingual-journalist-news-writer-content-producer/48452",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Multimedia Account Executive",
        url: "http://aldianews.com/pages/multimedia-account-executive/34575",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:sales].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Web Developer",
        url: "http://aldianews.com/pages/web-developer/43039",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, [skills[:php].id]},
    {%{
        name: "Marketing Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:marketing].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Design Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Digital Editorial Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Operations Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:pm].id,
        address_id: addresses[:al_dia_philly].id
    }, []}]
  end

  def fixtures_data(:seed, {companies, employment_types, titles, addresses, skills}) do
    [{%{
        name: "GRAPHIC DESIGNER",
        url: "http://1trickpony.com/jobs/graphic-designer",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "ACCOUNT COORDINATOR",
        url: "http://1trickpony.com/jbs/account-coordinator",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "COPYWRITER",
        url: "http://1trickpony.com/jobs/copywriter",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "SR. COPYWRITER / CONCEPT LEAD",
        url: "http://1trickpony.com/jobs/sr-copywriter-concept-lead",
        company_id: companies[:one_trick_pony].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_trick_hammonton].id
    }, []},
    {%{
        name: "Account Director",
        url: "http://160over90.com/careers/?job_id=b629f121-0df0-49cf-afd6-a2169ca98efd",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Account Supervisor",
        url: "http://160over90.com/careers/?job_id=0c3e5456-84fb-4f43-bc31-cb4a93503620",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:crm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Lead Photographer/Art Buyer",
        url: "http://160over90.com/careers/?job_id=c436d12b-b418-4d0b-8197-e58118982f59",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:photographer].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Program Manager",
        url: "http://160over90.com/careers/?job_id=d167f19b-702a-4385-87d3-83fac43c5201",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:pm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Associate Creative Director - Copy",
        url: "http://160over90.com/careers/?job_id=10259cf6-2899-453a-83bd-25fee1518b1c",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Copywriter",
        url: "http://160over90.com/careers/?job_id=4e242c85-4a53-4dc0-85ce-d1e1da66fada",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Creative Director",
        url: "http://160over90.com/careers/?job_id=28ba77d7-2011-46e2-aa72-36ee32fda4be",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Media Coordinator",
        url: "http://160over90.com/careers/?job_id=d7733586-b28f-4b34-9a3a-ec2305486f5a",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:analytics].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Senior Motion Designer",
        url: "http://160over90.com/careers/?job_id=5e5a32bd-e0b9-4c5d-b128-35fc39ae6851",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:video].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Video Project Manager",
        url: "http://160over90.com/careers/?job_id=f2938078-6f69-490c-8977-0d00a79a51e1",
        company_id: companies[:one_sixty_over_ninty].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:pm].id,
        address_id: addresses[:one_sixty_over_ninty_philly].id
    }, []},
    {%{
        name: "Digital Editor",
        url: "http://aldianews.com/pages/digital-editor/34550",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Content Producer",
        url: "http://aldianews.com/pages/bilingual-journalist-news-writer-content-producer/48452",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:copywriter].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Multimedia Account Executive",
        url: "http://aldianews.com/pages/multimedia-account-executive/34575",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:sales].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Web Developer",
        url: "http://aldianews.com/pages/web-developer/43039",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:full_time].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, [skills[:php].id]},
    {%{
        name: "Marketing Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:marketing].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Design Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:visual_designer].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Digital Editorial Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:editor].id,
        address_id: addresses[:al_dia_philly].id
    }, []},
    {%{
        name: "Operations Intern",
        url: "http://aldianews.com/pages/internships/34585",
        company_id: companies[:al_dia].id,
        employment_type_id: employment_types[:internship].id,
        title_id: titles[:pm].id,
        address_id: addresses[:al_dia_philly].id
    }, []}]
  end
end
