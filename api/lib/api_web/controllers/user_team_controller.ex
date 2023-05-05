defmodule ApiWeb.UserTeamController do
  use ApiWeb, :controller

  alias Api.UserTeams
  alias Api.UserTeams.UserTeam
  import Ecto.Query, warn: false
  alias Api.Repo

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    userteams = UserTeams.list_userteams()
    render(conn, "index.json", userteams: userteams)
  end

  def create(conn, %{"user_team" => user_team_params}) do
    with {:ok, %UserTeam{} = user_team} <- UserTeams.create_user_team(user_team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_team_path(conn, :show, user_team))
      |> render("show.json", user_team: user_team)
    end
  end

  def show(conn, %{"id" => id}) do
    user_team = UserTeams.get_user_team!(id)
    render(conn, "show.json", user_team: user_team)
  end

  def update(conn, %{"id" => id, "user_team" => user_team_params}) do
    user_team = UserTeams.get_user_team!(id)

    with {:ok, %UserTeam{} = user_team} <- UserTeams.update_user_team(user_team, user_team_params) do
      render(conn, "show.json", user_team: user_team)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_team = UserTeams.get_user_team!(id)

    with {:ok, %UserTeam{}} <- UserTeams.delete_user_team(user_team) do
      send_resp(conn, :no_content, "")
    end
  end

  def getAllUsersByTeam(conn, %{"team_id" => team_id}) do
    userteams = UserTeams.getAllUsersByTeam(team_id)
    render(conn, "index.json", userteams: userteams)
  end
  def getAllTeamsForUser(conn, %{"user_id" => user_id}) do
    userteams = UserTeams.getAllTeamsForUser(user_id)
    render(conn, "index.json", userteams: userteams)
  end

  def getID(conn, %{"user_id" => user_id, "team_id" => team_id}) do
    userteams =
      Repo.all(
        from(t in UserTeam, where: t.user_id == ^user_id and t.team_id == ^team_id, select: t)
      )

    render(conn, "index.json", userteams: userteams)
  end


end
