<template>
  <tr>
    <td class="attendance__td"> {{ element.status ? 'Clock-in' : 'Clock-out' }} </td>
    <td class="attendance__td"> {{ this.date }} </td>
    <td class="attendance__td"> {{ this.time }} </td>
  </tr>
</template>

<script>
import moment from 'moment'
moment().format()

export default {
  name: "ClockingHistoryCard",
  props: {
    element: {}
  },
  data() {
    return {
      date: moment(this.element.time).format("DD/MM/YYYY (ddd)"),
      time: moment(this.element.time).format("HH:mm:ss")
    }
  }
}
</script>

<style scoped>

</style>