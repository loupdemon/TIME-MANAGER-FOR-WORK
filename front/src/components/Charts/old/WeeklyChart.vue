<template>
  <div class="bar__chart">
    <vue3-chart-js v-bind="{ ...weeklyAttendance }" />
  </div>
</template>

<script>
import Vue3ChartJs from "@j-t-mcc/vue3-chartjs";

export default {
  name: "WeeklyChart",
  components: {
    Vue3ChartJs,
  },
  props: {
    labels: Array,
    data: Array
  },
  mounted() {
    return {
      type: "bar",
      options: {
        min: 0,
        max: 10,
        responsive: true,
        plugins: {
          legend: {
            position: "top",
          },
        },
        scales: {
          y: {
            min: 0,
            max: 10,
            ticks: {
              callback: function (value) {
                return `${value}h`;
              },
            },
          },
        },
      },
      data: {
        labels: ['Monday', 'Thursday', 'Wednesday'],
        datasets: [
          {
            label: "Weekly attendance",
            backgroundColor: ["#2980b9"],
            data: ['7.8', '8.5', '3.5'],
          },
        ],
      },
    };
  },
};
</script>
