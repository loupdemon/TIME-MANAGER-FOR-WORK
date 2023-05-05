<template>
 <div v-if="!this.$route.params.id || this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="main__container">
    <div class="profile__top">
      <h3 v-if="!this.$route.params.id" class="view-title">My profile</h3>
      <h3 v-else class="view-title"> {{ user_name }}'s profile</h3>
      <div class="profile__user__content">
        <div>
           <UserProfile ref="userprofile"/>
        </div>
        <div>
          <UserWorkedHours />
        </div>
      </div>
    </div>

    <div class="profile__details">
      <div class="flex flex-row items-center">
        <h3 class="view-title">Summary</h3>
        <router-link :to="`/attendance/${this.$route.params.id ? this.$route.params.id : ''}`" class="app-button text-sm bg-blue-500 text-white hover:bg-blue-800">Details</router-link>
      </div>
      <div class="profile__chart__container">
        <UserWeeklyBarChart/>
        <UserMonthlyBarChart />
        <UserOvertimeLineChart />
        <UserPieChart />
      </div>

    </div>

  </div>

  <Unauthorized v-else />
 
</template>

<script>
import Api from '../api/'
import UserProfile from '../components/User/UserProfile.vue'
import UserWorkedHours from '../components/User/UserWorkedHours.vue'
import UserWeeklyBarChart from "./User/UserWeeklyBarChart.vue"
import UserMonthlyBarChart from "./User/UserMonthlyBarChart.vue"
import Unauthorized from "./Errors/Unauthorized";
import UserOvertimeLineChart from "./User/UserOvertimeLineChart.vue";
import UserPieChart from "./User/UserPieChart";

export default {
  name: "Profile",
  components: {
    UserPieChart,
    Unauthorized,
    UserProfile,
    UserWorkedHours,
    UserWeeklyBarChart,
    UserMonthlyBarChart,
    UserOvertimeLineChart,
  },
  async mounted() {
    if (this.$route.params.id) {
      const user = (await Api.getUser(this.$route.params.id)).data.data
      this.user_name = user.username
    }
  },
  data() {
    return {
      user_id: "",
      user_name: "",
    }
  }
}
</script>

<style scoped>

</style>