defmodule ApiWeb.ClockController do
  use ApiWeb, :controller

  alias Api.Clocks
  alias Api.Clocks.Clock
  alias Api.Users

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    clocks = Clocks.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Clocks.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocks.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{}} <- Clocks.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_user_clocks(conn, %{"user_id" => user_id}) do
    user = Users.get_user!(user_id)

    clocks = Clocks.get_user_clocks(user_id)

    cond do
      !user -> conn |> put_status(:not_found) |> render("index.json", clocks: clocks)
      length(clocks) == 0 -> conn |> put_status(:not_found) |> render("index.json", clocks: clocks)
      true -> render(conn, "index.json", clocks: clocks)
    end

  end

  def create_user_clock(conn, %{"user_id" => user_id}) do

    user = Users.get_user!(user_id)

    status_structure = Enum.at(Clocks.get_status!(user_id),0)
    status = if (status_structure == nil) do
      false
    else
      status_structure.status
    end

    with {:ok, %Clock{} = clock} <- Clocks.create_user_clock(%{"user_id": user_id, "status": !status, "time": DateTime.utc_now()}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

end
