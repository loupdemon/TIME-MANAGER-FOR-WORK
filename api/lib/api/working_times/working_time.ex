defmodule Api.WorkingTimes.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "working_times" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :user, Api.Users.User

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end, :user_id])
    |> validate_required([:start, :end, :user_id])
    |> assoc_constraint(:user)

  end
end
