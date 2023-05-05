defmodule Api.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string
    field :job, :string
    field :role, :string
    field :photo, :string
    has_many(:clocks, Api.Clocks.Clock, on_replace: :delete)
    has_many(:working_times, Api.WorkingTimes.WorkingTime, on_replace: :delete)
    many_to_many(
      :teams,
      Api.Teams.Team,
      join_through: "user_teams",
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :job, :role , :photo])
    |> validate_required([:username, :password, :email])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+.[A-Za-z]+$/)
  end
end
