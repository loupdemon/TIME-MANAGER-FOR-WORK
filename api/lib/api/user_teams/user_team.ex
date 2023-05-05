defmodule Api.UserTeams.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_teams" do
    belongs_to :user, Api.Users.User
    belongs_to :team, Api.Teams.Team
    timestamps()
  end

  @doc false
  def changeset(user_team, attrs) do
    user_team
    |> cast(attrs, [:team_id, :user_id])
    |> validate_required([:user_id, :team_id])
    #|> assoc_constraint(:user, :team)
  end
end
