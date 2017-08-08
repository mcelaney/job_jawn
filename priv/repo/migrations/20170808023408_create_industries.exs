defmodule JobJawn.Repo.Migrations.CreateIndustries do
  use Ecto.Migration

  def change do
    create table(:industries) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

    create index(:industries, [:slug], unique: true)
  end
end
