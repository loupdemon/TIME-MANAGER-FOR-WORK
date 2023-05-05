<template>
  <div v-if="this.$store.state.user.role === 'Manager' || this.$store.state.user.role === 'General Manager'" class="main__container">
    <div class="flex flex-row">
      <h3 class="view-title"> Teams </h3>
      <AddTeam />
    </div>
    <TeamList />
  </div>

  <Unauthorized v-else />
</template>

<script>
import TeamList from './Teams/TeamList.vue'
import Unauthorized from "./Errors/Unauthorized"
import AddTeam from './Teams/AddTeam.vue'
export default {
  name: "AllTeams",
  components: {
    Unauthorized,
    TeamList,
    AddTeam
  }
}
</script>

<style scoped>

</style>