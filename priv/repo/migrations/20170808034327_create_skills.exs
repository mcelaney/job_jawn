defmodule JobJawn.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

    create index(:skills, [:slug], unique: true)
  end
end
