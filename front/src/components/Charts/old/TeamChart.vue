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
      type: "bar",
      options: {
        min: 0,
        max: 15,
        responsive: true,
        plugins: {
          legend: {
            position: "top",
          },
        },
        scales: {
          y: {
            min: 0,
            max: 15,
            ticks: {
              callback: function (value) {
                return `${value}P`;
              },
            },
          },
        },
      },
      data: {
        labels: ["EquipeA", "EquipeB", "EquipeC", "EquipeD", "EquipeE"],
        datasets: [
          {
            label: "Nombre de personnes presentes par equipe au quotidien",
            backgroundColor: ["#fffff"],
            data: [12, 13, 15, 10, 15],
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
