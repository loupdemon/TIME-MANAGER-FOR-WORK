defmodule Api.UserTeamsTest do
  use Api.DataCase

  alias Api.UserTeams

  describe "userteams" do
    alias Api.UserTeams.UserTeam

    import Api.UserTeamsFixtures

    @invalid_attrs %{}

    test "list_userteams/0 returns all userteams" do
      user_team = user_team_fixture()
      assert UserTeams.list_userteams() == [user_team]
    end

    test "get_user_team!/1 returns the user_team with given id" do
      user_team = user_team_fixture()
      assert UserTeams.get_user_team!(user_team.id) == user_team
    end

    test "create_user_team/1 with valid data creates a user_team" do
      valid_attrs = %{}

      assert {:ok, %UserTeam{} = user_team} = UserTeams.create_user_team(valid_attrs)
    end

    test "create_user_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserTeams.create_user_team(@invalid_attrs)
    end

    test "update_user_team/2 with valid data updates the user_team" do
      user_team = user_team_fixture()
      update_attrs = %{}

      assert {:ok, %UserTeam{} = user_team} = UserTeams.update_user_team(user_team, update_attrs)
    end

    test "update_user_team/2 with invalid data returns error changeset" do
      user_team = user_team_fixture()
      assert {:error, %Ecto.Changeset{}} = UserTeams.update_user_team(user_team, @invalid_attrs)
      assert user_team == UserTeams.get_user_team!(user_team.id)
    end

    test "delete_user_team/1 deletes the user_team" do
      user_team = user_team_fixture()
      assert {:ok, %UserTeam{}} = UserTeams.delete_user_team(user_team)
      assert_raise Ecto.NoResultsError, fn -> UserTeams.get_user_team!(user_team.id) end
    end

    test "change_user_team/1 returns a user_team changeset" do
      user_team = user_team_fixture()
      assert %Ecto.Changeset{} = UserTeams.change_user_team(user_team)
    end
  end
end
