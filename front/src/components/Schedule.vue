<template>
  <div v-if="!this.$route.params.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="main__container">
    <h3 class="view-title">
      {{ this.$route.params.id ? `${user_name}'s` : 'My' }} schedule
    </h3>
    <ScheduleCalendarComponent v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'"/>
    <ScheduleHistory />
  </div>

  <Unauthorized v-else />
</template>

<script>
import ScheduleHistory from "./Schedule/ScheduleHistory.vue"
import ScheduleCalendarComponent from "./Schedule/ScheduleCalendarComponent.vue";
import Api from "../api";
import Unauthorized from "./Errors/Unauthorized";

export default {
  name: "Schedule",
  components: {
    Unauthorized,
    ScheduleCalendarComponent,
    ScheduleHistory
  },
  async mounted(){
    if (this.$route.params.id) {
      const user = (await Api.getUser(this.$route.params.id)).data.data
      this.user_name = user.username
    }
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