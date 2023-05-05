<template>

  <div class="grid lg:grid-cols-4" v-if="!isTeamMembersLoading">
    <TeamWeeklyBarChart
    v-for="member in this.teamMembers"
    :id="member.id"
    :name="member.username"
    />
  </div>

</template>

<script>
import TeamWeeklyBarChart from "./TeamWeeklyBarChart";
import Api from '../../api'
export default {
  name: "TeamWeeklyChartList",
  props: ["teamId"],
  components: {TeamWeeklyBarChart},
  async mounted() {
    if (this.$route.params.id) this.team_id = this.$route.params.id
    else this.team_id = this.teamId
    this.teamMembers = await Api.getUsersFromTeamId(this.team_id)
    this.isTeamMembersLoading = false
    console.log(this.teamMembers)
  },
  data() {
    return {
      team_id: '',
      teamMembers: [],
      isTeamMembersLoading: true
    }
  }
}
</script>

<style scoped>

</style>