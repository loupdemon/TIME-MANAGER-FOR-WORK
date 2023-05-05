import moment from "moment";
import Api from '../api'

function getStartOfWeek() {
    return moment().startOf('week')
}

function getEndOfWeek() {
    return moment().endOf('week')
}

function getDaysBetweenDates(startDate, endDate) {
    const now = startDate.clone()
    const dates = []
    while (now.isSameOrBefore(endDate)) {
        dates.push(now.format('YYYY-MM-DD'))
        now.add(1, 'days')
    }
    return dates.slice(1,6);
}

function calculateHoursBetweenClockingTimes(startClock, endClock) {
    return moment(endClock, 'HH:mm:ss').diff(moment(startClock, 'HH:mm:ss'), 'hours', true).toPrecision(2)
}

function getTodaysWorkingTimes(listOfWorkingTimes, today) {
    return listOfWorkingTimes.filter(element => moment(element.start).format('YYYY-MM-DD') === today)
}

function getTodaysClockingTimes(listOfClockingTimes, today) {
    return listOfClockingTimes.filter(element => moment(element.time).format('YYYY-MM-DD') === today).map(element => moment(element.time).format('HH:mm:ss'))
}

function getUsersNotAssignedInTeam(allUsers, usersInTeam) {
    const teamUsersArray = usersInTeam.map(element => element.id)
    return allUsers.filter(element => !teamUsersArray.includes(element.id))
}


export default {
    getStartOfWeek,
    getEndOfWeek,
    getDaysBetweenDates,
    calculateHoursBetweenClockingTimes,
    getTodaysWorkingTimes,
    getTodaysClockingTimes,
    getUsersNotAssignedInTeam
}