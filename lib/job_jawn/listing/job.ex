defmodule JobJawn.Listing.Job do
  @moduledoc """
  A job.  You know... why we're here
  """
  use Ecto.Schema

  schema "jobs" do
    field :name, :string
    field :url, :string
    field :company_id, :id
    field :employment_type_id, :id
    field :title_id, :id
    field :address_id, :id

    timestamps()
  end
end
