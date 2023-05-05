defmodule ApiWeb.WorkingTimeView do
  use ApiWeb, :view
  alias ApiWeb.WorkingTimeView
  alias Api.Users

  def render("index.json", %{working_times: working_times}) do
    %{data: render_many(working_times, WorkingTimeView, "working_time.json")}
  end

  def render("show.json", %{working_time: working_time}) do
    %{data: render_one(working_time, WorkingTimeView, "working_time.json")}
  end

  def render("working_time.json", %{working_time: working_time}) do
    user = (Users.get_user!(working_time.user_id))
    %{
      id: working_time.id,
      start: working_time.start,
      end: working_time.end,
      user: %{
        id: user.id,
        name: user.username,
        email: user.email,
      }
    }
  end
end
