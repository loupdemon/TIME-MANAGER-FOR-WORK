<template>
  <PieChart
  v-if="this.isLoaded"
  v-bind:data="this.chartData"
  v-bind:labels="this.chartLabels"
  v-bind:color="this.color"
  />
</template>

<script>
import PieChart from '../Charts/PieChart.vue'
import Api from '../../api'

export default {
  name: "TeamsPieChart",
  components: {
    PieChart
  },
  async mounted() {
    this.teamList = (await Api.getAllTeams())
    this.chartLabels = this.teamList.map(team => team.name)
    let number
    for (let elem of this.teamList) {
      number = (await Api.getUsersFromTeamId(elem.id)).length
      this.chartData.push(number)
    }
    this.color = ["#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600"]
    this.isLoaded = true
  },
  data() {
    return {
      isLoaded: false,
      chartData: [],
      chartLabels: [],
      color: [],
      teamList: []
    }
  }
}
</script>

<style scoped>

</style>