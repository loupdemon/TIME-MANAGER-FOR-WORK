defmodule Api.UserTeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.UserTeams` context.
  """

  @doc """
  Generate a user_team.
  """
  def user_team_fixture(attrs \\ %{}) do
    {:ok, user_team} =
      attrs
      |> Enum.into(%{

      })
      |> Api.UserTeams.create_user_team()

    user_team
  end
end
