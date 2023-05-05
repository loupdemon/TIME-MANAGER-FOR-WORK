<template>
  <div class="teamcharts__container">
    <WeeklyChart />
    <WeeklyChart />
    <WeeklyChart />
    <WeeklyChart />
    <WeeklyChart />
    <WeeklyChart />
  </div>
</template>

<script>
import WeeklyChart from '../Charts/old/WeeklyChart.vue'
export default {
  name: "TeamCharts",
  components: {
    WeeklyChart
  }
}
</script>

<style scoped>

</style>