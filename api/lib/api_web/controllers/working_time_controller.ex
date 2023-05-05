defmodule ApiWeb.WorkingTimeController do
  use ApiWeb, :controller

  alias Api.WorkingTimes
  alias Api.WorkingTimes.WorkingTime
  alias Api.Users

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    working_times = WorkingTimes.list_working_times()
    render(conn, "index.json", working_times: working_times)
  end

  def create(conn, %{"working_time" => working_time_params}) do
    with {:ok, %WorkingTime{} = working_time} <- WorkingTimes.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = WorkingTimes.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = WorkingTimes.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- WorkingTimes.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = WorkingTimes.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- WorkingTimes.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_user_working_times_with_start_end(conn, %{"user_id" => user_id, "start" => start, "end" => xend}) do

    user = Users.get_user!(user_id)
    working_times = WorkingTimes.get_user_working_times_with_start_end(user_id, start, xend)

    cond do
      !user -> conn |> put_status(:not_found) |> render("index.json", working_times: working_times)
      length(working_times) == 0 -> conn |> put_status(:not_found) |> render("index.json", working_times: working_times)
      true -> render(conn, "index.json", working_times: working_times)
    end
  end

  def get_user_working_time(conn, %{"user_id" => user_id, "working_time_id" => working_time_id}) do

    user = Users.get_user!(user_id)
    working_times = WorkingTimes.get_user_working_time(user_id, working_time_id)

    cond do
      !user -> conn |> put_status(:not_found) |> render("index.json", working_times: working_times)
      length(working_times) == 0 -> conn |> put_status(:not_found) |> render("index.json", working_times: working_times)
      true -> render(conn, "index.json", working_times: working_times)
    end

  end

  def delete_user_working_time(conn, %{"user_id" => _, "working_time_id" => working_time_id}) do
    working_time = WorkingTimes.get_working_time!(working_time_id)

    with {:ok, %WorkingTime{}} <- WorkingTimes.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_all_user_working_times(conn, %{"user_id" => user_id}) do

    user = Users.get_user!(user_id)
    working_times = WorkingTimes.get_all_user_working_times(user_id)

    cond do
      !user -> conn |> put_status(:not_found) |> json(%{ "error": "There is no user"})
      length(working_times) == 0 -> conn |> put_status(:not_found) |> json(%{ "error": "There is nothing here"})
      true -> render(conn, "index.json", working_times: working_times)
    end

  end

  def create_user_working_time(conn, %{"working_time" => working_time_params, "user_id" => user_id}) do

    user = Users.get_user!(user_id)

    with {:ok, %WorkingTime{} = working_time} <- WorkingTimes.create_user_working_time(Map.put(working_time_params, "user_id", user_id)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

end
