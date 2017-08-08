defmodule JobJawn.Repo.Migrations.CreateEmploymentTypes do
  use Ecto.Migration

  def change do
    create table(:employment_types) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

    create index(:employment_types, [:slug], unique: true)
  end
end
