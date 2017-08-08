defmodule JobJawn.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :url, :text
      add :company_id, references(:companies, on_delete: :nothing)
      add :employment_type_id, references(:employment_types, on_delete: :nothing)
      add :title_id, references(:titles, on_delete: :nothing)
      add :address_id, references(:addresses, on_delete: :nothing)

      timestamps()
    end

    create index(:jobs, [:company_id])
    create index(:jobs, [:employment_type_id])
    create index(:jobs, [:title_id])
    create index(:jobs, [:address_id])
  end
end
