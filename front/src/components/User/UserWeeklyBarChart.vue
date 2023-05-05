<template>
    <WeeklyBarChart v-if="this.isLoaded"
    v-bind:data="this.chartData"
    v-bind:labels="this.chartLabels"
    v-bind:color="this.color"
    />
</template>

<script>
import WeeklyBarChart from "../Charts/WeeklyBarChart.vue"
import Utils from "../../utils"
import Api from '../../api'
export default {
  name: "UserWeeklyBarChart",
  components: {
    WeeklyBarChart
  },
  async mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
    this.startOfWeek = Utils.getStartOfWeek()
    this.endOfWeek = Utils.getEndOfWeek()
    this.chartLabels = Utils.getDaysBetweenDates(this.startOfWeek, this.endOfWeek)
    this.chartData = await this.getUserWeeklyData()
    this.isLoaded = true
  },
  methods: {
    async getUserWeeklyData() {
      this.clocks = await Api.getAttendancesFromUser(this.user_id)
      let datesClockingTimes
      let hoursBetweenClocks
      const userData = []
      this.chartLabels.forEach(date => {
        datesClockingTimes = Utils.getTodaysClockingTimes(this.clocks, date)
        hoursBetweenClocks = Utils.calculateHoursBetweenClockingTimes(datesClockingTimes[datesClockingTimes.length - 1], datesClockingTimes[0])
        userData.push(hoursBetweenClocks)
      })
      return userData;
    }
  },
  data() {
    return {
      user_id: '',
      clocks: [],
      startOfWeek: null,
      endOfWeek: null,
      isLoaded: false,
      chartData: [],
      chartLabels: [],
      color: 'rgba(173, 216, 230, 0.5)'
    }
  },
}
</script>

<style scoped>

</style>