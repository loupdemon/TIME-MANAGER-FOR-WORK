<template>
  <div class="attendance__table__container" v-if="!isAttendanceListLoading">
    <table class="attendance__table">
      <thead class="attendance__thead">
        <tr>
          <th scope="col" class="attendance__th">Day</th>
          <th scope="col" class="attendance__th">Scheduled times</th>
          <th scope="col" class="attendance__th">Worked times</th>
          <th scope="col" class="attendance__th">Hours this day</th>
        </tr>
      </thead>
      <tbody class="attendance__tbody">
        <AttendanceCard
        v-for="date in weekDates"
        :key="date.id"
        :day="date"
        :scheduleArray="this.schedule"
        :clocksArray="this.clocks"
        />
      </tbody>
    </table>
  </div>

  <loading v-else :active="isAttendanceListLoading"
           :can-cancel="false"
           :is-full-page="false"/>

</template>

<script>
import AttendanceCard from './AttendanceCard.vue'
import moment from 'moment'
import Api from "../../api";
import Utils from "../../utils";
moment().format()
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';


export default {
  name: "AttendanceList",
  components: {
    AttendanceCard,
    Loading
  },
  async mounted() {
    this.weekDates = Utils.getDaysBetweenDates(this.startOfWeek, this.endOfWeek)
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id

    const response = await Promise.all([Api.getWorkingTimesFromUser(this.user_id), Api.getAttendancesFromUser(this.user_id)])
    this.schedule = response[0]
    this.clocks = response[1]
    console.log(this.schedule, this.clocks)
    this.isAttendanceListLoading = false
  },
  data() {
    return {
      weekDates: [],
      startOfWeek: moment().startOf('week'),
      endOfWeek: moment().endOf('week'),
      schedule: [],
      clocks: [],
      isAttendanceListLoading: true
    }
  }
}
</script>

<style scoped>

</style>