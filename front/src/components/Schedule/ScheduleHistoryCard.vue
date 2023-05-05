<template>
  <tr>
    <td class="attendance__td">{{ startDay }}</td>
    <td class="attendance__td">{{ endDay }}</td>
    <td class="attendance__td">{{ startTime }} - {{ endTime }}</td>
    <td class="attendance__td">Work</td>
    <td> <button v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="app-button text-sm text-yellow-500 hover:bg-yellow-500 hover:text-white">Modify</button>  </td>
    <td> <button v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" @click="deleteWorkingTime" class="app-button text-sm text-red-500 hover:bg-red-500 hover:text-white">Delete</button>  </td>
  </tr>

  <teleport to="body">
    <vue3-snackbar bottom :duration="5000"/>
  </teleport>

</template>

<script>
import moment from 'moment'
moment().format()
import Api from '../../api'

export default {
  name: "ScheduleHistoryCard",
  props: {
    startDate: String,
    endDate: String,
    wtid: Number
  },
  mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
  },
  methods: {
    async deleteWorkingTime() {
      await Api.deleteWorkingTime(this.user_id, this.wtid)
      this.$snackbar.add({
        text: 'The schedule was successfully deleted.',
        type: 'success'
      })
      this.$router.go()
    }
  },
  data() {
    return {
      user_id: '',
      startDay: moment(this.startDate).format('DD/MM/YYYY (ddd)'),
      endDay: moment(this.endDate).format('DD/MM/YYYY (ddd)'),
      startTime: moment(this.startDate).format('HH:mm:ss'),
      endTime: moment(this.endDate).format('HH:mm:ss'),
    }
  }
}
</script>

<style scoped>

</style>