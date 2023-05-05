import axios from 'axios'

const API = axios.create({
    // baseURL: "http://167.71.52.98:4000/api/"
    baseURL: "http://localhost:4000/api/"
    // withCredentials: true
})

// API.interceptors.request.use((req) => {
//     if (localStorage && JSON.parse(localStorage.getItem("user"))) {
//         req.headers.Authorization = `Bearer ${JSON.parse(localStorage.getItem("user")).token}`;
//     }
//     return req;
// })


async function login(email, password) {
    try {
        // return (await axios.post('http://167.71.52.98:4000/auth', { user: { email: email, password: password } })).data
        return (await axios.post('http://localhost:4000/auth', { user: { email: email, password: password } })).data
    } catch(e) {
        console.log(e)
        return false
    }
}

async function logout() {
    localStorage.clear()
}

async function getAllUsers() {
    try {
        return (await API.get(`/users`)).data.data
    } catch(e) {
        console.log(e)
    }
}

async function getUser(user_id) {
    try {
        return await API.get(`/users/${user_id}`)
    } catch(e) {
        console.log(e)
    }
}
async function createUser(payload) {
    const data = {
        user: payload
    }
    try {
        return (await API.post(`/users`, { user: payload }))
    } catch (e) {
        console.log(e)
    }
}

async function updateUser(user_id, payload) {
    const updatedData = {
        user: payload
    }
    console.log(updatedData)
    try {
        return await API.put(`/users/${user_id}`, { user: payload })
    } catch (e) {
        console.log(e)
    }
}

async function deleteUser(user_id) {
    try {
        return await API.delete(`/users/${user_id}`)
    } catch (e) {
        console.log(e)
    }
}

async function getAttendancesFromUser(user_id) {
    try {
        const result = await API.get(`/clocks/${user_id}`)
        if (result.data.data.length === 0) return false
        else return result.data.data
    } catch (e) {
        if (e.response.status === 404) return false
    }
}

async function getLastAttendanceFromUser(user_id) {
    try {
        const result = await getAttendancesFromUser(user_id)
        if (result) return result[0]
        else return false
    } catch (e) {
        if (e.response.status === 404) return false
    }
}

async function userClocking(user_id) {
    try {
        return (await API.post(`/clocks/${user_id}`)).data.data
    } catch (e) {
        console.log(e)
    }
}

async function getWorkingTimesFromUser(user_id) {
    try {
        return (await API.get(`/workingtimes/${user_id}`)).data.data
    } catch (e) {
        console.log(e)
    }
}

async function getUserWorkingTimesWithStartEnd(user_id, start, end) {
    try {
        return (await API.get(`/workingtimes/${user_id}/start=${start}&end=${end}`)).data.data
    } catch (e) {
        console.log(e)
    }
}

async function createWorkingTime(user_id, startDate, endDate, startTime, endTime) {
    const payload = {
        start: `${startDate} ${startTime}`,
        end: `${endDate} ${endTime}`,
    }
    try {
        return (await API.post(`/workingtimes/${user_id}`, { working_time: payload})).data.data
    } catch (e) {
        console.log(e)
    }
}

async function deleteWorkingTime(user_id, workingTime_id) {
    try {
        return await API.delete(`/workingtimes/${user_id}/${workingTime_id}`)
    } catch (e) {
        console.log(e)
    }
}

async function getAllTeams() {
    try {
        return (await API.get(`/teams`)).data.data
    } catch(e) {
        console.log(e)
    }
}

async function getTeam(team_id) {
    try {
        return (await API.get(`/teams/${team_id}`)).data.data
    } catch (e) {
        console.log(e)
    }
}

async function updateTeam(team_id, payload) {
    try {
        return (await API.put(`/teams/${team_id}`, { team: payload }))
    } catch (e) {
        console.log(e)
    }
}

async function createTeam(payload) {
    try {
        return (await API.post(`/teams`, { team: payload }))
    } catch (e) {
        console.log(e)
    }
}

async function deleteTeam(team_id) {
    try {
        return await API.delete(`/teams/${team_id}`)
    } catch (e) {
        console.log(e)
    }
}

async function addTeamManager(team_id, manager_id) {
    try {
        const payload = { manager_team_id: manager_id }
        // Add manager to team members
        await addTeamMember(team_id, manager_id)
        // Add manager to team manager
        return (await API.put(`/teams/${team_id}`, { team: payload })).data.data
    } catch (e) {
        console.log(e)
    }
}

async function addTeamMember(team_id, user_id) {
    try {
        const res = await API.post(`/teams/${team_id}/user/${user_id}`)
        console.log(res)
    } catch (e) {
        console.log(e)
    }
}

async function getTeamsFromUserId(user_id) {
    try {
        const userTeams = (await API.get(`/userteams/teams/${user_id}`)).data.data
        // return userTeams.map(async(elem) => await getTeam(elem.team_id))
        const result = []
        let teamInfos = {}
        for (let team of userTeams) {
            teamInfos = await getTeam(team.team_id)
            result.push(teamInfos)
        }
        return result
    } catch (e) {
        console.log(e)
    }
}

async function getUsersFromTeamId(team_id) {
    try {
        const teamUsers = (await API.get(`/userteams/users/${team_id}`)).data.data
        const result = []
        let userInfos = {}
        for (let user of teamUsers) {
            userInfos = (await getUser(user.user_id)).data.data
            result.push(userInfos)
        }
        return result
    } catch (e) {
        console.log(e)
    }
}

async function deleteUserteam(user_id, team_id) {
    try {
        const userTeam = (await API.get(`/userteams/id/${user_id}/${team_id}`)).data.data
        for (let ut of userTeam) {
            //console.log(ut.id)
            return await API.delete(`/userteams/${ut.id}`);
        }
    } catch (e) {
        console.log(e)
    }
}


export default({
    login,
    logout,
    getAllUsers,
    getUser,
    updateUser,
    deleteUser,
    getAllTeams,
    getAttendancesFromUser,
    getLastAttendanceFromUser,
    userClocking,
    getWorkingTimesFromUser,
    createUser,
    getUserWorkingTimesWithStartEnd,
    createWorkingTime,
    deleteWorkingTime,
    getTeam,
    deleteTeam,
    updateTeam,
    addTeamManager,
    createTeam,
    addTeamMember,
    getTeamsFromUserId,
    getUsersFromTeamId,
    deleteUserteam
})