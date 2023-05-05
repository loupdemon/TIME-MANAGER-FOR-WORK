<template>

  <TeamMemberCard v-if="usersList.length !== 0"
  v-for="employee in usersList"
  :key="employee.id"
  :employee="employee"
  :teamManager="this.teamManager"
  />

  <span v-else>There is no member in the team yet...</span>
</template>

<script>
import TeamMemberCard from '../Teams/TeamMemberCard.vue'

export default {
  name: "TeamList.vue",
  props: ["usersList", "teamManager","team_id"],
  components: {
    TeamMemberCard
  }
}
</script>

<style scoped>

</style>