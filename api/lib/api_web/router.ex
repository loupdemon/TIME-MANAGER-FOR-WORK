defmodule ApiWeb.Router do
  use ApiWeb, :router

  alias Api.Token
  alias Api.Users

  pipeline :api do
    plug :accepts, ["json"]
#    plug :authenticate
  end

  pipeline :auth do
    plug :accepts, ["json"]
  end

  #TODO: modify request to retrieve user role and check if user has rights
# def authenticate(conn, params) do
#   headers = conn
#             #|> get_req_header("authorization")
#            |> get_Token()
#
#   cond do
#     length(headers) != 0 -> token = Enum.at(headers,0)
#                             # If OK
#                             with {:ok, response} <- Token.verify(token) do
#                               # TODO: modify the request body and go to next function
#                               conn
#                             end
#     true -> conn
#             |> put_status(:forbidden)
#             |> json(%{ error: "not authenticated" })
#             |> halt()
#   end
#
#   conn
#   |> put_status(:forbidden)
#   |> json(%{ error: "not authenticated" })
#   |> halt()
# end
#
# def get_Token(conn) do
#
#  fetch_cookies(conn, encrypted: ~w(UserToken))
#  |> Map.from_struct()
#  |> get_in([:cookies, "UserToken"])
#
# end


  scope "/auth", ApiWeb do
    pipe_through :auth

    post "/", UserController, :login
  end

  scope "/api", ApiWeb do
    pipe_through :api

    # USER ROUTES
    get "/users", UserController, :index
    get "/users/teammanager", UserController, :getAllTeamManager
    resources "/users", UserController, except: [:new, :edit]

    # WORKING TIME ROUTES
    get "/workingtimes/:user_id/:start/:end", WorkingTimeController, :get_user_working_times_with_start_end
    get "/workingtimes/:user_id/:working_time_id", WorkingTimeController, :get_user_working_time
    delete "/workingtimes/:user_id/:working_time_id", WorkingTimeController, :delete_user_working_time
    get "/workingtimes/:user_id", WorkingTimeController, :get_all_user_working_times
    post "/workingtimes/:user_id", WorkingTimeController, :create_user_working_time
    resources "/workingtimes", WorkingTimeController, except: [:new, :edit]

    # CLOCKING ROUTES
    get "/clocks/:user_id", ClockController, :get_user_clocks
    post "/clocks/:user_id", ClockController, :create_user_clock
    resources "/clocks", ClockController, except: [:new, :edit]

    # TEAM ROUTES
    post "/teams/:team_id/user/:user_id", TeamController, :addTeamToUser
    #post "/teams/manager/:id", TeamController, :update
    resources "/teams", TeamController, except: [:new, :edit]

    # USER_TEAM ROUTES

    #Recupere les utilisateurs d'une équipe
    get "/userteams/users/:team_id", UserTeamController, :getAllUsersByTeam
    #Recupere les équipes d'un utilisateur
    get "/userteams/teams/:user_id", UserTeamController, :getAllTeamsForUser
    #Recupere l'ID d'un userteam
    get "/userteams/id/:user_id/:team_id", UserTeamController, :getID
    resources "/userteams", UserTeamController, except: [:new, :edit]


  end

end
