<template>
  <MonthlyBarChart v-if="this.isLoaded"
   v-bind:data="this.chartData"
   v-bind:labels="this.chartLabels"
   v-bind:color="this.color"
  />
</template>

<script>
import MonthlyBarChart from '../Charts/MonthlyBarChart.vue'
export default {
  name: "UserMonthlyBarChart",
  components: {
    MonthlyBarChart
  },
  mounted() {
    this.chartData = [37, 38, 36, 37]
    this.chartLabels = ['Week 1', 'Week 2', 'Week 3', 'Week 4']
    this.isLoaded = true
  },
  data() {
    return {
      isLoaded: false,
      chartData: [],
      chartLabels: [],
      color: 'rgb(248, 121, 121, 0.5)'
    }
  }
}
</script>

<style scoped>

</style>