<template>
  <tr>
    <td class="attendance__td"> {{ formattedDate }} </td>
    <td v-if="schedule.length !== 0" class="attendance__td">  {{ scheduleStart }} - {{ scheduleEnd }} </td>
    <td v-else class="attendance__td"> Free </td>
    <td v-if="clocks.length !== 0" class="attendance__td"> {{ clockStart }} - {{ clockEnd }} </td>
    <td v-else class="attendance__td"> Absent </td>
    <td class="attendance__td"> {{ total }} {{ total ? 'hours' : ''}}</td>
  </tr>
</template>

<script>
import moment from 'moment'
moment().format()
import Utils from '../../utils'

export default {
  name: "AttendanceCard",
  props: ["day", "scheduleArray", "clocksArray"],
  async mounted() {

    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id

    if (this.clocksArray.length !== 0) {
      this.clocks = Utils.getTodaysClockingTimes(this.clocksArray, this.day)
      this.clockStart = this.clocks[this.clocks.length-1]
      this.clockEnd = this.clocks[0]
      this.total = Utils.calculateHoursBetweenClockingTimes(this.clockStart, this.clockEnd)
    }

    if (this.scheduleArray.length !== 0) {
      this.schedule = Utils.getTodaysWorkingTimes(this.clocksArray, this.day)
      this.scheduleStart = moment(this.schedule[0].start).format('HH:mm')
      this.scheduleEnd = moment(this.schedule[0].end).format('HH:mm')
    }



  },
  data() {
    return {
      user_id: '',
      formattedDate: moment(this.day).format('DD/MM/YYYY (ddd)'),
      schedule: [],
      scheduleStart: '',
      scheduleEnd: '',
      clocks: [],
      clockStart: '',
      clockEnd: '',
      total: ''
    }
  }
}
</script>

<style scoped>

</style>