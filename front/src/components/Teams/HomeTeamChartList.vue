<template>
  <div>
    <TeamWeeklyChartList :teamId="this.team.id"/>
  </div>
</template>

<script>
import Api from '../../api'
import TeamWeeklyChartList from "./TeamWeeklyChartList";

export default {
  name: "HomeTeamChartList",
  components: {TeamWeeklyChartList},
  async mounted() {
    this.teamList = await Api.getTeamsFromUserId(this.$store.state.user.id)
    this.team = this.teamList[0]
  },
  data() {
    return {
      teamList: [],
      team: {}
    }
  }
}
</script>

<style scoped>

</style>