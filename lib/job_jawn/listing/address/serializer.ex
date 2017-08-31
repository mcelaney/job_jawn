defmodule JobJawn.Listing.Address.Serializer do
  @moduledoc """
  API serializer for addresses
  """
  use JaSerializer

  location "/addresses/:id"
  attributes [:city,
              :lat,
              :line_1,
              :line_2,
              :long,
              :phone,
              :state,
              :zip]

  has_one :company,
    serializer: JobJawn.Listing.Company.Serializer,
    include: true,
    field: :company,
    type: JobJawn.Listing.Company

  has_many :jobs,
    serializer: JobJawn.Listing.Job.Serializer,
    include: false,
    identifiers: :when_included
end
