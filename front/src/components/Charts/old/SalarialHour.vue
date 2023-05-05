<template>
  
 <main class="center py-8 sm:px-64">
            <div class="p-4">

                <div  class="mt-4 p-4 bg-white rounded shadow font-semibold text-center hover:shadow-md">
                   <div style="max-width: 600px">
                        <vue3-chart-js v-bind="{ ...barChart }" />
                    </div>
                </div>
            </div>
        </main>


</template>

<script>
import Vue3ChartJs from "@j-t-mcc/vue3-chartjs";

export default {
  name: "WeeklyChart",
  components: {
    Vue3ChartJs,
  },
  setup() {
    const barChart = {
      type: "line",
      options: {
        min: 0,
        max: 150,
        responsive: true,
        plugins: {
          legend: {
            position: "top",
          },
        },
        scales: {
          y: {
            min: 0,
            max: 150,
            ticks: {
              callback: function (value) {
                return `${value}$`;
              },
            },
          },
        },
      },
      data: {
        labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        datasets: [
          {
            label: "Le coût de tous les employés par jour",
            backgroundColor: ["#2980b9"],
            data: [40, 44, 34, 60, 55],
          },
        ],
      },
    };

    return {
      barChart,
    };
  },
};
</script>
