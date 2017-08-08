defmodule JobJawn.Listing.Company do
  @moduledoc """
  Organizations which may offer jobs
  """
  use Ecto.Schema

  schema "companies" do
    field :homepage, :string
    field :jobs_page, :string
    field :name, :string
    field :slug, :string
    field :industry_id, :id

    timestamps()
  end
end
