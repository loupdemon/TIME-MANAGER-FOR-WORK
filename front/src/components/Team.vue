<template>
  <div class="main__container" v-if="this.$store.state.user.role === 'General Manager' || this.teamList.some(member => member.id === this.$store.state.user.id)">

    <div class="employees__team" v-if="!this.isTeamLoading">
      <div class="flex flex-row">
        <h3 class="view-title">{{ this.team.name }} members</h3>
        <AddTeamMember v-if="this.$store.state.user.id === this.team.manager || this.$store.state.user.role === 'General Manager' "/>
        <ModifyTeam v-if="this.$store.state.user.id === this.team.manager || this.$store.state.user.role === 'General Manager' "/>
      </div>

      <div class="flex flex-col" v-if="!this.teamManager">
        <button @click="showAddManager" class="self-center app-button bg-yellow-500 text-white hover:bg-yellow-700">+ Assign a manager to this team</button>
        <div class="self-center mt-2" v-if="isAddManager">
          <span class="mr-2">Manager:</span>
          <select v-model="teamManagerToSave" class="px-2 border border-gray-500 rounded-md">
            <option v-for="user in this.teamManagerList" :value="user"> {{ user.username }}</option>
          </select>
          <button @click="saveManager" class="app-button bg-blue-500 hover:bg-blue-600 text-white text-sm">SAVE</button>
        </div>
      </div>
      <ManagerCard v-else
      :managerInfos="this.teamManager"/>


      <div class="flex flex-row justify-items-center mb-3">
        <button v-bind:class="{'bg-blue-500 text-white': !isChart, 'text-blue-500': isChart}" class="app-button text-sm hover:bg-blue-200" @click="isCharts">Members list</button>
        <button v-if='this.$store.state.user.role === "Team Manager" || this.$store.state.user.role === "General Manager"' v-bind:class="{'bg-blue-500 text-white': isChart, 'text-blue-500': !isChart}" class="app-button text-sm hover:bg-blue-200" @click="isCharts">Charts</button>
      </div>

      <TeamWeeklyChartList v-if='isChart'/>
      <TeamList v-else
      :usersList="this.teamList"
      :teamManager="this.team.manager"
      />
    </div>

    <loading v-else :active="isTeamLoading"
             :can-cancel="false"
             :is-full-page="false"/>

  </div>

  <Unauthorized v-else />

</template>

<script>
import TeamList from '../components/Employees/TeamList.vue'
import AddTeamMember from "./Teams/AddTeamMember";
import ManagerCard from "./Employees/ManagerCard.vue"
import TeamWeeklyChartList from './Teams/TeamWeeklyChartList.vue'

import Api from '../api'
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
import Unauthorized from "./Errors/Unauthorized";
import ModifyTeam from "./Teams/ModifyTeam";
export default {
  name: "Team",
  components: {
    ModifyTeam,
    Unauthorized,
    TeamList,
    AddTeamMember,
    ManagerCard,
    TeamWeeklyChartList,
    Loading
  },
  async mounted() {
    if (this.$route.params.id) this.team_id = this.$route.params.id
    // else 404 error
    this.team = await Api.getTeam(this.team_id)
    if (this.team.manager) this.teamManager = (await Api.getUser(this.team.manager)).data.data
    this.teamList = await Api.getUsersFromTeamId(this.team_id)
    this.isTeamLoading = false;
  },
  data() {
    return {
      team_id: '',
      teamName: 'Team',
      isChart: false,
      teamManager: '',
      teamList: [],
      isTeamLoading: true,
      isAddManager: false,
      teamManagerList: [],
      teamManagerToSave: {}
    }
  },
  methods: {
    isCharts() {
      this.isChart = !this.isChart
    },
    async showAddManager() {
      this.isAddManager = true
      this.teamManagerList = (await Api.getAllUsers()).filter(user => user.role === 'Team Manager' || user.role === 'General Manager')
      this.teamManagerToSave = this.teamManagerList[0]
    },
    async saveManager() {
      await Api.addTeamManager(this.team_id, this.teamManagerToSave.id)
      this.$router.go()
    }
  }
}
</script>

<style scoped>

</style>