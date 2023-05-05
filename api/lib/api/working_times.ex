defmodule Api.WorkingTimes do
  @moduledoc """
  The WorkingTimes context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.WorkingTimes.WorkingTime

  @doc """
  Returns the list of working_times.

  ## Examples

      iex> list_working_times()
      [%WorkingTime{}, ...]

  """
  def list_working_times do
    Repo.all(WorkingTime)
  end

  @doc """
  Gets a single working_time.

  Raises `Ecto.NoResultsError` if the Working time does not exist.

  ## Examples

      iex> get_working_time!(123)
      %WorkingTime{}

      iex> get_working_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_working_time!(id), do: Repo.get!(WorkingTime, id)

  @doc """
  Creates a working_time.

  ## Examples

      iex> create_working_time(%{field: value})
      {:ok, %WorkingTime{}}

      iex> create_working_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_working_time(attrs \\ %{}) do
    %WorkingTime{}
    |> WorkingTime.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a working_time.

  ## Examples

      iex> update_working_time(working_time, %{field: new_value})
      {:ok, %WorkingTime{}}

      iex> update_working_time(working_time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_working_time(%WorkingTime{} = working_time, attrs) do
    working_time
    |> WorkingTime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a working_time.

  ## Examples

      iex> delete_working_time(working_time)
      {:ok, %WorkingTime{}}

      iex> delete_working_time(working_time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_working_time(%WorkingTime{} = working_time) do
    Repo.delete(working_time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking working_time changes.

  ## Examples

      iex> change_working_time(working_time)
      %Ecto.Changeset{data: %WorkingTime{}}

  """
  def change_working_time(%WorkingTime{} = working_time, attrs \\ %{}) do
    WorkingTime.changeset(working_time, attrs)
  end

  def get_all_user_working_times(user_id) do
    query =
      from wt in WorkingTime,
           where: wt.user_id == ^user_id,
           order_by: [asc: wt.start]
    Repo.all(query)
#    WorkingTime
#    |> where(user_id: ^user_id)
#    |> Repo.all()
  end

  def get_user_working_time(user_id, working_time_id) do
    WorkingTime
    |> where(user_id: ^user_id, id: ^working_time_id)
    |> Repo.all()
  end

  def get_user_working_times_with_start_end(user_id, start, xend) do
    query =
      from wt in WorkingTime,
        where: wt.user_id == ^user_id and wt.start >= ^start and wt.end <= ^xend

    Repo.all(query)
  end


  def create_user_working_time(attrs \\ %{}) do
    %WorkingTime{}
    |> WorkingTime.changeset(attrs)
    |> Repo.insert()
  end

end
