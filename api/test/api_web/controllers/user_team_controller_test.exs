defmodule ApiWeb.UserTeamControllerTest do
  use ApiWeb.ConnCase

  import Api.UserTeamsFixtures

  alias Api.UserTeams.UserTeam

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all userteams", %{conn: conn} do
      conn = get(conn, Routes.user_team_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_team" do
    test "renders user_team when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_team_path(conn, :create), user_team: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_team_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_team_path(conn, :create), user_team: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_team" do
    setup [:create_user_team]

    test "renders user_team when data is valid", %{conn: conn, user_team: %UserTeam{id: id} = user_team} do
      conn = put(conn, Routes.user_team_path(conn, :update, user_team), user_team: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_team_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_team: user_team} do
      conn = put(conn, Routes.user_team_path(conn, :update, user_team), user_team: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_team" do
    setup [:create_user_team]

    test "deletes chosen user_team", %{conn: conn, user_team: user_team} do
      conn = delete(conn, Routes.user_team_path(conn, :delete, user_team))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_team_path(conn, :show, user_team))
      end
    end
  end

  defp create_user_team(_) do
    user_team = user_team_fixture()
    %{user_team: user_team}
  end
end
