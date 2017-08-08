defmodule JobJawn.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :slug, :string
      add :homepage, :text
      add :jobs_page, :text
      add :industry_id, references(:industries, on_delete: :nothing)

      timestamps()
    end

    create index(:companies, [:industry_id])
    create index(:companies, [:slug], unique: true)
  end
end
