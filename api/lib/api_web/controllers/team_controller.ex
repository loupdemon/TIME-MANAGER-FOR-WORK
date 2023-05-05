defmodule ApiWeb.TeamController do
  use ApiWeb, :controller

  alias Api.Teams
  alias Api.Teams.Team
  alias Api.UserTeams
  alias Api.UserTeams.UserTeam
  alias Api.Api_web.Views.UserTeamView

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    teams = Teams.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- Teams.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Teams.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Teams.get_team!(id)

    with {:ok, %Team{} = team} <- Teams.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Teams.get_team!(id)

    with {:ok, %Team{}} <- Teams.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end

  def addTeamToUser(conn, %{"team_id" => team_id, "user_id" => user_id}) do
    userteam = %{user_id: user_id, team_id: team_id}


    with {:ok, %UserTeam{} = user_team} <- UserTeams.create_user_team(userteam) do
      conn
      |> put_view(ApiWeb.UserTeamView)
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_team_path(conn, :show, user_team))
      |> render("show.json", user_team: user_team)
    end
  end

end
