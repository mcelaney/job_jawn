defmodule JobJawn.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :line_1, :string
      add :line_2, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :phone, :string
      add :lat, :float
      add :long, :float
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:addresses, [:company_id])
  end
end
