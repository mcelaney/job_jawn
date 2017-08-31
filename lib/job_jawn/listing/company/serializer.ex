defmodule JobJawn.Listing.Company.Serializer do
  @moduledoc """
  API serializer for companies
  """
  use JaSerializer

  location "/companies/:id"
  attributes [:homepage, :jobs_page, :name, :slug]

  has_one :industry,
    serializer: JobJawn.Listing.Industry.Serializer,
    include: true,
    field: :industry,
    type: JobJawn.Listing.Industry

  has_many :jobs,
    serializer: JobJawn.Listing.Job.Serializer,
    include: false,
    identifiers: :when_included
end
