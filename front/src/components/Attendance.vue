<template>
  <div v-if="!this.$route.params.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="main__container">
    <h3 class="view-title">{{ this.$route.params.id ? `${ user_name }'s` : 'My' }} attendances</h3>
    <span v-if="!this.$route.params.id">You can find your latest clocking times here. In case of any missing time, please report it to your manager or HR services.</span>
    <span v-else>You can find the employee's clocking times here and clock-in/out for them if needed.</span>

    <LatestAttendance />
    <div class="attendance__week mt-5 mb-3">
      <span class="font-xl font-bold">Your week's clocking history</span>
      <AttendanceList />
    </div>

    <div class="attendance__clocking__history mt-5 mb-3 flex flex-col">
      <span class="font-xl font-bold mb-3">Latest clocking history</span>
      <ClockingHistory />
    </div>
  </div>

  <Unauthorized v-else />
</template>

<script>
import AttendanceList from '../components/Attendance/AttendanceList.vue'
import LatestAttendance from '../components/Attendance/LatestAttendance.vue'
import ClockingHistory from '../components/Attendance/ClockingHistory.vue'
import Api from '../api'
import Unauthorized from "./Errors/Unauthorized";

export default {
  name: "Attendance",
  components: {
    Unauthorized,
    AttendanceList,
    LatestAttendance,
    ClockingHistory
  },
  async mounted() {
    this.user_name = (await Api.getUser(this.$route.params.id)).data.data.username
  },
  data() {
    return {
      user_name: ''
    }
  }
}
</script>

<style scoped>

</style>