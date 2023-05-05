alias Api.Users.User
alias Api.Teams.Team
alias Api.Clocks.Clock

Api.Repo.insert! %Team{
  name: "Team A"
}

Api.Repo.insert! %Team{
  name: "Team B"
}

Api.Repo.insert! %Team{
  name: "Team C"
}

Api.Repo.insert! %User{
  username: "Jeremy",
  email: "jeremy@mail.com",
  role: "User",
  job: "Modal master",
  photo: "https://figurinepop.com/public/2021/07/charmandermetallic1_2.jpg",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %User{
  username: "Vy",
  email: "vy@mail.com",
  role: "User",
  job: "Ingénieur bac + 17",
  photo: "https://thumbs.gfycat.com/WigglyWellgroomedBangeltiger-mobile.jpg",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %User{
  username: "Aghiles",
  email: "aghiles@mail.com",
  role: "Team Manager",
  job: "Front master",
  photo: "https://static.wikia.nocookie.net/pokemon/images/f/f8/Nurse_Joy_Bulbasaur.png/revision/latest?cb=20151104082828",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %User{
  username: "Jordan",
  email: "jordan@mail.com",
  role: "User",
  job: "Déploiement master (le pauvre)",
  photo: "https://pbs.twimg.com/media/DmpPJkfXcAAr4ft.jpg",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %User{
  username: "Zemmour",
  email: "zemmour@mail.com",
  role: "General Manager",
  job: "Président",
  photo: "https://cdn.unitycms.io/image/ocroped/1200,1200,1000,1000,0,0/g5XCaFF7VjI/AKLTL_BgKSw84eCLTQeSz-.jpg",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %User{
  username: "Caillou",
  email: "caillou@mail.com",
  role: "Team Manager",
  job: "Enfant chauve",
  photo: "https://yt3.ggpht.com/ytc/AKedOLRvprj_LeAudDJhzctfh7aClne7qdxiRPgSiGyN=s900-c-k-c0x00ffffff-no-rj",
  password: "GI3oBk6znCiYVhIWzqyZM2mD3iLTkffoJbxbqp1GsTY="
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 5
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 3
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 2
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 4
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 1
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 08:00:07],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-15 16:47:01],
  status: false,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 07:53:57],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-16 17:01:30],
  status: false,
  user_id: 6
}

Api.Repo.insert! %Clock {
  time: ~N[2021-11-17 08:00:07],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-17 16:30:27],
  status: false,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 08:05:35],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-18 16:38:50],
  status: false,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 07:58:36],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-19 12:55:35],
  status: false,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 13:45:05],
  status: true,
  user_id: 6
}

Api.Repo.insert! %Clock{
  time: ~N[2021-11-20 17:15:11],
  status: false,
  user_id: 6
}

