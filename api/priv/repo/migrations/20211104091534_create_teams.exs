defmodule Api.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :manager_team_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:teams, [:manager_team_id])
  end
end
