defmodule Api.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    query =
      from u in User,
           order_by: [asc: u.username]
    Repo.all(query)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def get_user_with_email_username(email, username) do
#    User
#    |> where(email: ^email, username: ^username)
#    |> Repo.all()
     query =
       from u in User,
                where: u.email == ^email or u.username == ^username

     Repo.all(query)
  end

  def get_user_with_email(email) do
    #    User
    #    |> where(email: ^email, username: ^username)
    #    |> Repo.all()
    query =
      from u in User,
           where: u.email == ^email

    Repo.all(query)
  end

#  def get_user_with_team(id, team) do
#    query =
#      from u in User,
#        where: u.id != ^id and u.team == ^team
#
#    Repo.all(query)
#  end

  def user_login(email, password) do
    User
    |> where(email: ^email, password: ^password)
    |> Repo.all()
  end

  def getAllTeamManager() do

    query =
      from u in User,
           where: u.role == "Team manager"

    Repo.all(query)

  end

end
