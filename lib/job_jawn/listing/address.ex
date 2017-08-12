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

  def fixtures_data(:test, companies) do
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
                              zip: "19103",
                              company_id: companies[:one_sixty_over_ninty].id}},
     {:al_dia_philly, %{city: "Philadelphia",
                              lat: 39.9536876,
                              line_1: "1835 Market Street",
                              line_2: "4th Floor",
                              long: -75.1711393,
                              phone: "215-569-4666",
                              state: "PA",
                              zip: "19106",
                              company_id: companies[:al_dia].id}}]
  end

  def fixtures_data(:seed, companies) do
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
                              zip: "19103",
                              company_id: companies[:one_sixty_over_ninty].id}},
     {:al_dia_philly, %{city: "Philadelphia",
                              lat: 39.9536876,
                              line_1: "1835 Market Street",
                              line_2: "4th Floor",
                              long: -75.1711393,
                              phone: "215-569-4666",
                              state: "PA",
                              zip: "19106",
                              company_id: companies[:al_dia].id}}]
  end
end
