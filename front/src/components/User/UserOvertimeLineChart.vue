<template>
  <OvertimeLineChart
  v-if="this.isLoaded"
  v-bind:data="this.chartData"
  v-bind:labels="this.chartLabels"
  v-bind:color="this.color"
  />
</template>

<script>
import OvertimeLineChart from "../Charts/OvertimeLineChart.vue"

export default {
  name: "UserOvertimeLineChart",
  components: {
    OvertimeLineChart
  },
  mounted() {
    this.chartLabels = ["Week 1", "Week 2", "Week 3", "Week 4"]
    this.chartData = [2, 3, 1, 1.5]
    this.color = "rgb(255,250,205, 0.5)"
    this.isLoaded = true
  },
  data() {
    return {
      isLoaded: false,
      chartData: [],
      chartLabels: [],
      color: ""
    };
  }
}
</script>

<style scoped>

</style>