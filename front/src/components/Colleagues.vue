<template>
  <div class="main__container">
    <h3 class="view-title text-center">My teams</h3>
    <div class="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4" v-if="!isUserTeamsLoading && this.userTeams.length !== 0">
      <TeamCard
          v-for="team in this.userTeams"
          :team="team"
      />
    </div>

    <loading v-else-if="isUserTeamsLoading" :active="isUserTeamsLoading"
             :can-cancel="false"
             :is-full-page="false"/>

    <div class="mt-5 flex flex-col items-center" v-else-if="this.userTeams.length === 0">
      <img class="align-middle" src="https://media4.giphy.com/media/IVI400I6C0W1ltnqNe/giphy.gif?cid=ecf05e47vj9aago2v6klzlznlgjyu2aqdiy8m85nqomi43pz&rid=giphy.gif&ct=g" alt="No Team" />
      <span class="text-center my-5">You haven't been affected to a team yet.</span>
    </div>

  </div>
</template>

<script>
import Api from '../api'
import TeamCard from './Teams/TeamCard.vue'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
export default {
  name: "Team",
  components: {
    TeamCard,
    Loading
  },
  async mounted() {

    if (this.$route.params.id) this.user_id = this.$route.params.id
    else this.user_id = this.$store.state.user.id

    this.userTeams = await Api.getTeamsFromUserId(this.user_id)
    this.isUserTeamsLoading = false

  },
  data() {
    return {
      user_id: '',
      userTeams: [],
      isUserTeamsLoading: true
    }
  }
}
</script>