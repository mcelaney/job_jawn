defmodule JobJawn.Listing.Address do
  @moduledoc """
  A physical location for a job
  """
  use Ecto.Schema
  alias JobJawn.Listing.Address.Fixtures
  alias JobJawn.Listing.Company
  alias JobJawn.Listing.Job

  @type t :: %__MODULE__{}

  defdelegate fixtures_data(env, companies), to: Fixtures

  schema "addresses" do
    field :city, :string
    field :lat, :float
    field :line_1, :string
    field :line_2, :string
    field :long, :float
    field :phone, :string
    field :state, :string
    field :zip, :string

    belongs_to :company, Company
    has_many :jobs, Job

    timestamps()
  end
end
