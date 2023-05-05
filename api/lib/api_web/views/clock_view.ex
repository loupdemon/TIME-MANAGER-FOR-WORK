defmodule ApiWeb.ClockView do
  use ApiWeb, :view
  alias ApiWeb.ClockView
  alias Api.Users

  def render("index.json", %{clocks: clocks}) do
    %{data: render_many(clocks, ClockView, "clock.json")}
  end

  def render("show.json", %{clock: clock}) do
    %{data: render_one(clock, ClockView, "clock.json")}
  end

  def render("clock.json", %{clock: clock}) do
    user = (Users.get_user!(clock.user_id))
    %{
      id: clock.id,
      time: clock.time,
      status: clock.status,
      user: %{
        id: user.id,
        name: user.username,
        email: user.email,
      }
    }
  end
end
