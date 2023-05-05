<template>
  <PieChart
  v-if="this.isLoaded"
  v-bind:data="this.chartData"
  v-bind:labels="this.chartLabels"
  v-bind:color="this.color"/>
</template>

<script>
import PieChart from "../Charts/PieChart";
export default {
  name: "UserPieChart",
  components: {
    PieChart
  },
  mounted() {
    this.chartLabels = ["Week 1", "Week 2", "Week 3", "Week 4"]
    this.chartData = [2, 3, 1, 1.5]
    this.color = ["rgb(0,63,92,0.5)", "rgb(88,80,141, 0.5)", "rgb(188,80,144, 0.5)", "rgb(255,99,97, 0.5)"]
    this.isLoaded = true
  },
  data() {
    return {
      isLoaded: false,
      chartData: [],
      chartLabels: [],
      color: []
    }
  }
}
</script>

<style scoped>

</style>