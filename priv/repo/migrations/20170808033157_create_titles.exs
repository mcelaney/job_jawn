defmodule JobJawn.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :name, :string
      add :slug, :string
      add :discipline_id, references(:disciplines, on_delete: :nothing)

      timestamps()
    end

    create index(:titles, [:slug], unique: true)
    create index(:titles, [:discipline_id])
  end
end
