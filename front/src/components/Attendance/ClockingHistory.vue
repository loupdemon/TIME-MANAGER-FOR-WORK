<template>
  <div v-if="attendance" class="attendance__table__container">
    <table class="attendance__table">
      <thead class="attendance__thead">
        <tr>
          <th scope="col" class="attendance__th">Type</th>
          <th scope="col" class="attendance__th">Day</th>
          <th scope="col" class="attendance__th">Time</th>
        </tr>
      </thead>
      <tbody class="attendance__tbody">
        <ClockingHistoryCard
        v-for="element in attendance"
        :key="element.id"
        :element="element"/>
      </tbody>
    </table>
  </div>
  <span v-else>You haven't done any clocking yet, or they aren't on record!</span>
</template>

<script>
import ClockingHistoryCard from "./ClockingHistoryCard.vue"
import Api from '../../api'

export default {
  name: "ClockingHistory",
  components: {
    ClockingHistoryCard
  },
  async mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
    this.attendance = await Api.getAttendancesFromUser(this.user_id)
  },
  data() {
    return {
      user_id: '',
      attendance: []
    }
  }
}
</script>

<style scoped>

</style>