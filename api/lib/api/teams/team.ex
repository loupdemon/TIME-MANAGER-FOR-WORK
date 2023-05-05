defmodule Api.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :manager_team_id , :id
    many_to_many(
      :users,
      Api.Users.User,
      join_through: "user_teams",
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name , :manager_team_id])
    |> validate_required([:name])
  end
end
