<template>

  <div class="flex flex-col mb-5">
    <div class="flex flex-col mb-5">
      <span class="mb-2 text-center">Select the start date:</span>
      <div class="flex flex-row self-center">
        <datepicker :lowerLimit="Date.now()" :class="`border rounded-md px-2 pt-1 mr-2 ${!this.error.status ? 'border-gray-500 hover:border-blue-500' : 'border-red-600'}`" v-model="startDate" />
        <select class="border rounded-md border-gray-500 ml-2" v-model="startTime">
          <option
              v-for="(time, index) in timeList"
              :key="index"
              :value="time">
            {{ time }}
          </option>
        </select>
      </div>

    </div>

    <div class="flex flex-col mb-5">
      <span class="mb-2 text-center">Select the end date:</span>
      <div class="flex flex-row self-center">
        <datepicker :lowerLimit="Date.now()" :class="`border rounded-md px-2 pt-1 mr-2 ${!this.error.status ? 'border-gray-500 hover:border-blue-500' : 'border-red-600'}`" v-model="endDate" />
        <select class="border rounded-md border-gray-500 ml-2" v-model="endTime">
          <option
              v-for="(time, index) in timeList"
              :key="index"
              :value="time">
            {{ time }}
          </option>
        </select>
      </div>

      <span class="text-red-500 text-center mt-3" v-if="error.status">{{ error.message }}</span>

    </div>
    <div class="flex flex-col">
      <button @click="createSchedule" class="app-button text-white bg-blue-500 hover:bg-blue-700 self-center">Create new schedule</button>
    </div>
  </div>

  <teleport to="body">
    <vue3-snackbar bottom :duration="5000"/>
  </teleport>

</template>

<script>
import moment from 'moment'
moment().format()
import Api from '../../api'

import Datepicker from 'vue3-datepicker'
export default {
  name: "ScheduleCalendarComponent",
  components: {
    Datepicker
  },
  mounted() {
    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id
  },
  methods: {
    async createSchedule() {
      if (moment(`${moment(this.endDate).format("YYYY-MM-DD")} ${this.endTime}`) <= moment(`${moment(this.startDate).format("YYYY-MM-DD")} ${this.startTime}`)) {
        this.error.message = "Wrong input, please double check your dates."
        this.error.status = true
        this.$snackbar.add({
          text: this.error.message,
          type: 'error'
        })
      }
      else {
        await Api.createWorkingTime(this.user_id, moment(this.startDate).format("YYYY-MM-DD"), moment(this.endDate).format("YYYY-MM-DD"), this.startTime, this.endTime)
        this.$snackbar.add({
          text: "The schedule was successfully created.",
          type: "success"
        })
        this.$router.go()
      }
    }
  },
  data() {
    return {
      user_id: '',
      error: {
        status: false,
        message: 'err'
      },
      startDate: new Date(),
      endDate: new Date(),
      startTime: "08:00",
      endTime: "18:00",
      timeList: ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    }
}
}
</script>

<style scoped>

</style>