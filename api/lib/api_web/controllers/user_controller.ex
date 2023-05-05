defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  import Ecto.Query, warn: false
  alias Api.Repo
  alias Api.Users
  alias Api.Hashpassword
  alias Api.Users.User
  alias Api.Token
  alias Api.Hashpassword

  action_fallback ApiWeb.FallbackController

  def encodeToken(claims) do
    Token.generate_and_sign!(claims)
  end

  # TODO: retrieve user role and check if user has rights
  def authenticate(conn, _params) do
    headers = conn |> get_req_header("authorization")
    if (length(headers) !== 0) do
      token = Enum.at(headers,0)
      # If OK
      with {:ok, response} <- Token.verify(token) do
        user = Users.get_user!(response["id"])
        conn
        |> put_status(200)
        |> json(%{ id: user.id, role: user.role })
      end
    end
    # If invalid token
    conn
    |> put_status(:forbidden)
    |> json(%{ error: "not authenticated" })
  end

  def login(conn, %{"user" => user_params}) do
    email = user_params["email"]
    password = Hashpassword.generate_hashed_password(user_params["password"])
    user = Users.user_login(email, password)

    cond do
      length(user) === 0 ->
        conn
        |> put_status(:not_found)
        |> text("User not found")
      true ->
        token = encodeToken(%{ "id": Enum.at(user, 0).id, "role": Enum.at(user, 0).role})

        conn
        |> put_status(200)
#        |> put_resp_cookie("UserToken", token, http_only: true, max_age: 2_592_000, encrypt: true)
        |> json(%{ "id": Enum.at(user,0).id, "role": Enum.at(user,0).role, "token": token})

        #text(conn,fetch_cookies(conn, encrypted: ~w(UserToken)))
    end

  end

  def index(conn, %{"username" => username, "email" => email}) do
    users =
      Repo.all(
        from(t in User, where: t.username == ^username or t.email == ^email, select: t, limit: 1)
      )

    render(conn, "index.json", users: users)
  end

  def index(conn, %{"username" => username}) do
    users = Repo.all(from(t in User, where: t.username == ^username, select: t, limit: 1))
    render(conn, "index.json", users: users)
  end

  def index(conn, %{"email" => email}) do
    users = Repo.all(from(t in User, where: t.email == ^email, select: t, limit: 1))
    render(conn, "index.json", users: users)
  end

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    new_password = Hashpassword.generate_hashed_password(user_params["password"])
    user_params = Map.put(user_params, "password", new_password)
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      claims = %{"id": user.id, "role": user.role}
      token = %{"token": encodeToken(claims)}
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> json(token)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)
    #TODO: hash modified password if new
    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end


  def getAllTeamManager(conn) do
    users = Users.getAllTeamManager()

    render(conn, "index.json", users: users)
  end

#  def get_user_with_team(conn, %{"id" => id, "team" => team}) do
#    user = Users.get_user_with_team(id, team)
#    render(conn, "index.json", users: user)
#  end

end
