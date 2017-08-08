defmodule JobJawn.Repo.Migrations.CreateDisciplines do
  use Ecto.Migration

  def change do
    create table(:disciplines) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

    create index(:disciplines, [:slug], unique: true)
  end
end
