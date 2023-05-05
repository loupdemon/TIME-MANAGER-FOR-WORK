<template>
  <div class="attendance__table__container" v-if="userWorkingTimes.length !== 0">
    <table class="attendance__table">
      <thead class="attendance__thead">
      <tr>
        <th scope="col" class="attendance__th">Start date</th>
        <th scope="col" class="attendance__th">End date</th>
        <th scope="col" class="attendance__th">Time</th>
        <th scope="col" class="attendance__th">Type</th>
        <th scope="col" colspan="2" class="attendance__th"> </th>
      </tr>
      </thead>
      <tbody class="attendance__tbody">
      <ScheduleHistoryCard
      v-for="time in userWorkingTimes"
      :key="time.id"
      :startDate="time.start"
      :endDate="time.end"
      :wtid="time.id"
      />
      </tbody>
    </table>
  </div>

  <span v-else>There is no schedule at this time.</span>

</template>

<script>
import ScheduleHistoryCard from './ScheduleHistoryCard.vue'
import Api from '../../api'
export default {
  name: "ScheduleHistory",
  components: {
    ScheduleHistoryCard
  },
  async mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
    this.userWorkingTimes = await Api.getWorkingTimesFromUser(this.user_id)
  },
  data() {
    return {
      user_id: '',
      userWorkingTimes: []
    }
  }
}
</script>

<style scoped>

</style>