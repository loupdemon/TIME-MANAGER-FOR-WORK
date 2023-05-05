<template>
  <div>
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
  setup() {
    const weeklyAttendance = {
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
            max: 50,
            ticks: {
              callback: function (value) {
                return `${value}h`;
              },
            },
          },
        },
      },
      data: {
        labels: ["Week 1", "Week 2", "Week 3", "Week 4"],
        datasets: [
          {
            label: "Monthly attendance",
            backgroundColor: ["#2980b9"],
            data: [34.5, 35.7, 36, 38, 35.5],
          },
        ],
      },
    };

    return {
      weeklyAttendance,
    };
  },
};
</script>
