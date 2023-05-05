defmodule Api.Repo.Migrations.CreateUserteams do
  use Ecto.Migration

  def change do
    create table(:user_teams) do
      add(:team_id, references(:teams, on_delete: :delete_all), primary_key: true)
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)
      timestamps()
    end

    create unique_index(:user_teams, [:team_id, :user_id])
  end
end
