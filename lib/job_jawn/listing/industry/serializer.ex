defmodule JobJawn.Listing.Industry.Serializer do
  @moduledoc """
  API serializer for industries
  """
  use JaSerializer

  location "/industries/:id"
  attributes [:name, :slug]

  has_many :companies,
    serializer: JobJawn.Listing.Job.Company,
    include: false,
    identifiers: :when_included
end
