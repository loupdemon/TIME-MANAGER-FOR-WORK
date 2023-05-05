<template>
  <div class="attendance__latest__container">
    <span v-if="attendance" class="text-lg font-semibold"> {{ this.$route.params.id ? "This employee" : "You" }} {{ attendance.status ? 'clocked-in' : 'clocked-out' }} on {{ `${latestClockingData.day}, ${latestClockingData.date} at ${latestClockingData.time}.`}}</span>
    <span v-else class="text-lg font-semibold">{{ this.$route.params.id ? "This employee has'nt" : "You haven't"}} clocked-in yet.</span>
    <div>
      <button @click="userClocking" v-if="attendance.status" class="app-button text-lg text-white bg-red-500 hover:bg-red-800">Clock-out</button>
      <button @click="userClocking" v-else class="app-button text-lg text-white bg-green-500 hover:bg-green-800">Clock-in</button>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
moment().format()
import Api from '../../api/'

export default {
  name: "LatestAttendance",
  async mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
    this.attendance = await Api.getLastAttendanceFromUser(this.user_id)
    this.getDateFromDatetime(this.attendance.time)
  },
  methods: {
    getDateFromDatetime(datetimeData) {
      const dateMoment= moment(datetimeData)
      this.latestClockingData.day = dateMoment.format('dddd')
      this.latestClockingData.date = dateMoment.format('DD/MM/YYYY')
      this.latestClockingData.time = dateMoment.format('HH:mm:ss')
    },
    async userClocking() {
      await Api.userClocking(this.user_id)
      this.$router.go()
    },
  },
  data() {
    return {
      user_id: '',
      attendance: [],
      latestClockingData: {},
    }
  }
}
</script>

<style scoped>

</style>