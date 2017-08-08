defmodule JobJawn.Listing.Address do
  @moduledoc """
  A physical location for a job
  """
  use Ecto.Schema

  schema "addresses" do
    field :city, :string
    field :lat, :float
    field :line_1, :string
    field :line_2, :string
    field :long, :float
    field :phone, :string
    field :state, :string
    field :zip, :string
    field :company_id, :id

    timestamps()
  end
end
