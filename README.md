# Time Manager

Epitech MSc 1 Pool project.

Members:
- AZZOUG Aghiles
- DONEY Jordan
- DUONG Thanh-Vy
- LEDERMANN Jeremy

## Back-end
### Installation
Written in Elixir and Phoenix Framework.

Browse to `/api/config/dev.exs` to change your PostgreSQL credentials, then run:

`cd /api` && `mix deps.get` && `mix ecto.setup` && `mix phx.server` to run the api.

### Routes
The api is accessible through `localhost:4000/api/`

The login is accessible through `localhost:4000/auth`

#### Users
Get all users : `GET /users/` (general manager)

Get one user : `GET /users/:userId` (general manager, manager, user (self))

Create one user : `POST /users/` (general manager, user?)

Update or delete one user : `PUT/DELETE /users/:userId` (general manager, manager, user(self))

Get teams from user : `GET /userteams/teams/:userId`

### Teams
Get all teams : `GET /teams/` (general manager)

Get one team : `GET /teams/:teamId`

Create one team : `POST /teams/`

Add a manager : `PUT /teams/:teamId`

Add a user to a team : `POST /teams/:teamId/user/:userId`

Get users from a team : `GET /userteams/users/:teamId`

#### Clocking times
Get clocking-times from one user : `GET /clocks/:userId`

Post clocking-time for one user : `POST /clocks/:userId`

#### Working times
Get a user's working times : `GET /workingtimes/:userId`

Get a specific working time from an user, knowing its id: `GET /workingtimes/:userId/:workingTimeId`

Create a working time for a user : `POST /workingtimes/:userId`

## Front-end
### Installation
Written in VueJS with Vue CLI and Tailwind CSS. Run:

`cd /front` && `npm i` && `npm run serve`

### Routes
The UI is accessible through `localhost:8080`

#### Home
Route: `/`

Contains various charts for the current logged-in user.

#### Profile
Route: `/profile` (self)

Dynamic route: `/profile/:userId` (general manager, manager)

Contains user details (username, email) and ways to modify the informations. 

Constraints:
- The user can only change the username, email and password.
- The general manager can change the role, the team and add working times
- The manager can change the team and add working times

#### Attendance
Route: `/attendance` (self)

Dynamic route: `/attendance/:userId` (general manager, manager)

Contains the week's working times and clocking times in one table along with a history of the X latest clocking times.

Also contains a component to clock-in or clock-out and displays the latest clock-in or clock-out time.

#### Team
Route: `/colleagues` (self)

Dynamic route: `/team/:teamId` (general manager)

Contains the members of the specified team.

Constraints: 
- The general manager and the manager can see the button "See details" that send them to the user's `/profile/:userId` page.
- The general manager and the manager can modify an employee's details right away (without clicking on See Details)
- The general manager can delete a specific user

#### Employees
Route: `/employees` (general manager)

Contains the list of all the members in the database.