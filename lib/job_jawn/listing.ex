defmodule JobJawn.Listing do
  @moduledoc """
  Responsible for management of jobs and related information
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias JobJawn.Listing.{
        Address,
        Company,
        Discipline,
        EmploymentType,
        Industry,
        Skill,
        Title}

  @address_required [:line_1, :line_2, :city, :state, :zip, :phone, :lat, :long]
  @meta_required [:name, :slug]
  @company_required [:name, :slug, :homepage, :jobs_page]

  def changeset(item, attrs) do
    case item do
      %Company{} ->
        company
        |> cast(attrs, @company_required)
        |> validate_required(@company_required)
      %Address{} ->
        address
        |> cast(attrs, @address_required)
        |> validate_required(@address_required)
      _ ->
        job
        |> cast(attrs, @meta_required)
        |> validate_required(@meta_required)
    end
  end
end
