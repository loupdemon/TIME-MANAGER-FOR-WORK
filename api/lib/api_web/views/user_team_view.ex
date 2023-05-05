defmodule ApiWeb.UserTeamView do
  use ApiWeb, :view
  alias ApiWeb.UserTeamView

  def render("index.json", %{userteams: userteams}) do
    %{data: render_many(userteams, UserTeamView, "user_team.json")}
  end

  def render("show.json", %{user_team: user_team}) do
    %{data: render_one(user_team, UserTeamView, "user_team.json")}
  end

  def render("user_team.json", %{user_team: user_team}) do
    %{
      id: user_team.id,
      team_id: user_team.team_id,
      user_id: user_team.user_id
    }
  end
end
