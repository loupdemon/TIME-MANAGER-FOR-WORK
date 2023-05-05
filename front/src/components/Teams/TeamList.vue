<template>
  <div class="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3" v-if="!isTeamListLoading && teamsList.length !== 0">
    <TeamCard
    v-for="team in teamsList"
    :team="team"
    />
  </div>

  <span v-else-if="teamsList.length === 0">There is no team here yet. Perhaps you should add one?</span>

  <loading v-else :active="isTeamListLoading"
           :can-cancel="false"
           :is-full-page="false"/>
</template>

<script>
import TeamCard from './TeamCard.vue'
import Api from '../../api'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';

export default {
  name: "TeamList",
  components: {
    TeamCard,
    Loading
  },
  async mounted() {
    this.teamsList = await Api.getAllTeams()
    this.isTeamListLoading = false
  },
  data() {
    return {
      teamsList: [],
      isTeamListLoading: true,
    }
  }
}
</script>

<style scoped>

</style>